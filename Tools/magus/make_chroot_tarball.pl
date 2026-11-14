#!/usr/bin/env perl
#
# Copyright (c) 2007 Chris Reinhardt. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright notice
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $MidnightBSD: mports/Tools/magus/make_chroot_tarball.pl,v 1.12 2011/06/20 22:51:11 laffer1 Exp $
#
# MAINTAINER=   ctriv@MidnightBSD.org
#
# Build a tarball for the magus chroot environment.
#
# usage:  make_chroot_tarball.pl [options] <tarballname>
#
#   --release VERSION  Stage the published release world for VERSION (for
#                      example 4.0.8) from the mirror: base.txz, plus
#                      lib32.txz when the release has it.  If the mirror has
#                      no such release (current, or a branch that has not
#                      been released yet) fall back to a custom tarball made
#                      from the host's installed world.  The fallback is only
#                      taken when VERSION matches the host's major.minor and
#                      architecture, since the host world is what gets
#                      packed.
#   --arch ARCH        Release architecture: amd64, i386, aarch64 or riscv64.
#                      Defaults to the host's (uname -p).
#   --mirror URL       Mirror base URL.  Default ftp://ftp1.midnightbsd.org
#                      (ftp://ftp3.midnightbsd.org is the other primary).
#
# Without --release the custom tarball is built from the host's world, as
# before.  Either way the output is <tarballname>.xz.
#
use strict;
use warnings;
use Digest::SHA;
use File::Basename qw(basename);
use File::Temp qw(tempdir);
use Getopt::Long;

my %supported_arch = map { $_ => 1 } qw(amd64 i386 aarch64 riscv64);

my $release;
my $arch;
my $mirror = 'ftp://ftp1.midnightbsd.org';

GetOptions(
  'release=s' => \$release,
  'arch=s'    => \$arch,
  'mirror=s'  => \$mirror,
) or usage();

my $ballname = shift || usage();
usage() if @ARGV;

my $host_arch = `uname -p`;
chomp $host_arch;
$arch //= $host_arch;

die "Unsupported architecture '$arch' (supported: "
  . join(' ', sort keys %supported_arch) . ")\n"
  unless $supported_arch{$arch};
die "Invalid release version '$release'\n"
  if defined $release && $release !~ m/^\d+(?:\.\d+)+(?:-RELEASE)?$/;
die "Invalid mirror URL '$mirror'\n"
  unless $mirror =~ m{^(?:ftp|https?)://[A-Za-z0-9.:-]+(?:/[A-Za-z0-9._/-]*)?$};
$mirror =~ s{/+$}{};

my $tmpdir = tempdir('/tmp/magusXXXXXXXX', CLEANUP => 1);

# Paths dropped from both kinds of tarball.  /etc/ssl/cert.pem is a symlink to
# the ca_root_nss package's bundle; if it is present in the chroot, mport
# refuses to install ca_root_nss ("already exists but is not managed by
# mport").  A build chroot never boots, so the loader, boot blocks and
# kernel are dead weight; Magus::Chroot's mtree pass recreates the /boot
# directories.
my @common_excludes = qw(
  /etc/ssl/cert.pem
  /boot
);

if (defined $release) {
  if (stage_release($release)) {
    finish();
    exit 0;
  }

  # Nothing published for this version: the custom path packs the host's
  # world, so only do that when the host actually is that branch and arch.
  my $host_rel = `uname -r`;
  chomp $host_rel;
  my ($want_mm) = $release =~ m/^(\d+\.\d+)/;
  my ($host_mm) = $host_rel =~ m/^(\d+\.\d+)/;

  die "No $release release for $arch on $mirror, and the host is $host_arch;"
    . " a custom tarball can only be built from the host's own world.\n"
    if $arch ne $host_arch;
  die "No $release release for $arch on $mirror, and the host is $host_rel;"
    . " build the custom tarball on a $want_mm host instead.\n"
    if !defined $host_mm || $want_mm ne $host_mm;

  print "No published $release release for $arch on $mirror;"
    . " building a custom tarball from the host's $host_rel world.\n";
}
elsif ($arch ne $host_arch) {
  die "--arch $arch needs --release: a custom tarball can only be built"
    . " from the host's own ($host_arch) world.\n";
}

stage_custom();
finish();
exit 0;


sub usage {
  die "Usage: $0 [--release VERSION] [--arch ARCH] [--mirror URL] <tarball name>\n";
}

# Try to build the tarball from the release's distribution sets.  Returns
# false if the mirror has no such release; dies on any other failure.
sub stage_release {
  my ($version) = @_;

  my @candidates = ($version);
  push @candidates, "$version-RELEASE" unless $version =~ m/-RELEASE$/;

  my ($url, $manifest);
  for my $dir (@candidates) {
    $url = "$mirror/pub/MidnightBSD/releases/$arch/$dir";
    $manifest = fetch_manifest("$url/MANIFEST");
    last if $manifest;
  }
  return 0 unless $manifest;

  die "$url/MANIFEST lists no base.txz\n" unless $manifest->{'base.txz'};

  # Only the userland sets; kernel, src, tests, mports and debug sets are not
  # wanted in a build chroot.
  my @sets = grep { $manifest->{$_} } qw(base.txz lib32.txz);
  print "Staging $version release for $arch from $url: @sets\n";

  my @archives;
  for my $set (@sets) {
    my $file = "$tmpdir/$set";
    run('/usr/bin/fetch', '-o', $file, "$url/$set");
    verify_sha256($file, $manifest->{$set});
    push @archives, "\@$file";
  }

  # Release archives store entries as ./path.  Also drop ./sys: base.txz
  # ships it as a symlink to usr/src/sys, and Magus::Chroot creates that
  # symlink itself and dies if it already exists.
  my @excludes = map { "--exclude=.$_" } @common_excludes, '/sys';

  run('/usr/bin/tar', '-cf', $ballname, @excludes, @archives);
  unlink("$tmpdir/$_") for @sets;

  return 1;
}

# Returns { set name => sha256 } or undef if the MANIFEST can't be fetched.
sub fetch_manifest {
  my ($url) = @_;

  my $file = "$tmpdir/MANIFEST";
  unlink($file);
  return undef if system('/usr/bin/fetch', '-q', '-o', $file, $url) != 0;

  my %sums;
  open(my $fh, '<', $file) || die "Couldn't open $file: $!\n";
  while (my $line = <$fh>) {
    my ($name, $sum) = split(/\t/, $line);
    next unless defined $sum && $sum =~ m/^[0-9a-f]{64}$/;
    $sums{$name} = $sum;
  }
  close($fh);
  unlink($file);

  return %sums ? \%sums : undef;
}

sub verify_sha256 {
  my ($file, $want) = @_;

  my $got = Digest::SHA->new(256)->addfile($file, 'b')->hexdigest;
  die basename($file) . ": SHA256 mismatch (MANIFEST $want, got $got)\n"
    if $got ne $want;
  print basename($file) . ": SHA256 OK\n";
}

# Pack the host's installed world.
sub stage_custom {
  # list of files and dirs that are passed to tar normally.
  my @files = qw(
    /.cshrc
    /.mkshrc
    /.profile
    /COPYRIGHT
    /bin
    /etc
    /lib
    /libexec
    /rescue
    /root/.cshrc
    /root/.k5login
    /root/.login
    /root/.mkshrc
    /root/.profile
    /sbin
    /usr/bin
    /usr/include
    /usr/lib
    /usr/lib32
    /usr/libdata
    /usr/libexec
    /usr/sbin
    /usr/share
    /var/account
    /var/at
    /var/at/jobs
    /var/at/spool
    /var/audit
    /var/backups
    /var/db/entropy
    /var/db/ipf
    /var/db/locate.database
    /var/empty
    /var/games
    /var/heimdal
    /var/preserve
    /var/run/ppp
    /var/run/os-release
    /var/tmp/vi.recover
    /var/unbound
    /var/yp/Makefile
    /var/yp/Makefile.dist
  );

  # Not every arch or build has all of these (lib32 is amd64-only, and
  # WITHOUT_* knobs drop others); tar would fail on a missing path.
  my @present;
  for my $path (@files) {
    if (-e $path || -l $path) {
      push @present, $path;
    }
    else {
      print "Skipping missing $path\n";
    }
  }

  my @excludes = map { "--exclude=$_" } @common_excludes;

  run('/usr/bin/tar', '-cpf', $ballname, @excludes, @present);

  # directories to get out of the tempdir
  my @tempdirs = qw(mnt proc);
  mkdir("$tmpdir/$_") for @tempdirs;

  run('/usr/bin/tar', '-C', $tmpdir, '-rpf', $ballname, @tempdirs);
}

sub finish {
  run('xz', $ballname);
  run('/bin/ls', '-hl', "$ballname.xz");
}

sub run {
  my (@command) = @_;

  print "@command\n";
  system { $command[0] } @command;

  if ($? == 0) {
    return;
  }

  if ($? == -1) {
    die "Couldn't execute: $!\n";
  }

  die "Command \"@command\" returned non-zero ($?)\n";
}
