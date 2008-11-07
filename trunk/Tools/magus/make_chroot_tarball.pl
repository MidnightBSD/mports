#!/usr/local/bin/perl
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
# $MidnightBSD: mports/Tools/magus/make_chroot_tarball.pl,v 1.6 2008/11/06 20:11:22 ctriv Exp $
#
# MAINTAINER=   ctriv@MidnightBSD.org
#
# Build a tarball for the magus chroot envirement.
#
# usage:  make_chroot_tarball.pl <tarballname>
#
use strict;
use warnings;
use File::Temp qw(tempdir);

my $ballname = shift || die "Usage: $0 <tarball name>\n";

my $tmpdir = tempdir('/tmp/magusXXXXXXXX', CLEANUP => 1);

# list of files and dirs that are passed to tar normally.
my @files = qw(
  /.cshrc
  /.profile
  /bin
  /boot/beastie.4th
  /boot/boot
  /boot/boot0
  /boot/boot0sio
  /boot/boot1
  /boot/boot2
  /boot/cdboot
  /boot/defaults
  /boot/defaults/loader.conf
  /boot/device.hints
  /boot/frames.4th
  /boot/kernel
  /boot/loader
  /boot/loader.4th
  /boot/loader.help
  /boot/loader.rc
  /boot/mbr
  /boot/modules
  /boot/pxeboot
  /boot/screen.4th
  /boot/support.4th
  /COPYRIGHT
  /lib
  /libexec
  /rescue
  /root/.cshrc
  /root/.k5login
  /root/.login
  /root/.profile
  /sbin
  /usr/bin
  /usr/games
  /usr/include
  /usr/lib
  /usr/libdata
  /usr/libexec
  /usr/sbin
  /var/account
  /var/at
  /var/at/jobs
  /var/at/spool
  /var/backups
  /var/db/entropy
  /var/db/ipf
  /var/db/locate.database
  /var/empty
  /var/games
  /var/heimdal
  /var/named
  /var/preserve
  /var/run/named
  /var/run/ppp
  /var/tmp/vi.recover
  /var/yp/Makefile
  /var/yp/Makefile.dist
);

# directories to get out of the tempdir
my @tempdirs = qw(mnt proc usr/share etc var/named);

run(qq(/usr/bin/tar -cpf $ballname --exclude '*perl*' @files));


run("mtree -p $tmpdir -f /usr/src/etc/mtree/BSD.root.dist -dU");
run("mtree -p $tmpdir/usr -f /usr/src/etc/mtree/BSD.usr.dist -dU");
run("mtree -p $tmpdir/var -f /usr/src/etc/mtree/BSD.var.dist -dU");
run("mtree -p $tmpdir/var/named -f /usr/src/etc/mtree/BIND.chroot.dist -dU");

run("cd /usr/src/share && make DESTDIR=$tmpdir install");
run("cd /usr/src/etc && make DESTDIR=$tmpdir distribution");

inject_etc_files($tmpdir);

run(qq(tar -C $tmpdir -rpf $ballname @tempdirs));
run(qq(bzip2 $ballname));
run(qq(/bin/ls -hl $ballname.bz2));

# clean this up so the tmpdir can get deleted
run(qq(chflags 0 $tmpdir/var/empty));

sub run {
  my ($command) = @_;

  print "$command\n";
  system($command);
  
  if ($? == 0) {
    return;
  }
  
  if ($? == -1) {
    die "Couldn't execute: $!\n";
  }
  
  die "Command \"$command\" returned non-zero ($?)\n";
}

sub inject_etc_files {
  my ($tempdir) = @_;
  
  my @files = (
    {
      name     => 'resolv.conf',
      contents => <<END,
search emich.edu
nameserver 164.76.2.251
nameserver 164.76.2.54
nameserver 164.76.102.66
END
    }
  );
  
  foreach my $file (@files) {
    open(my $fh, '>', "$tempdir/etc/$file->{name}") || die "Couldn't open $tempdir/etc/$file->{name}: $!\n";
    print $fh $file->{contents};
    close($fh) || die "Couldn't close $tempdir/etc/$file->{name}: $!\n";
  }
}

