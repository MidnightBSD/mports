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
# Build a tarball for the magus chroot envirement.
#
# usage:  make_chroot_tarball.pl <tarballname>
#
use strict;
use warnings;
use File::Temp qw(tempdir);

my $ballname = shift || die "Usage: $0 <tarball name>\n";

my $tmpdir = tempdir('/tmp/magusXXXXXXXX', CLEANUP => 1);

# Get the CPU architecture
my $arch = `uname -m`;
chomp $arch;

# list of files and dirs that are passed to tar normally.
my @files = qw(
  /.cshrc
  /.mkshrc
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
  /boot/loader.rc
  /boot/mbr
  /boot/modules
  /boot/pxeboot
  /boot/screen.4th
  /boot/support.4th
  /COPYRIGHT
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

# Add /usr/lib32 for amd64 architecture
if ($arch eq 'amd64') {
    push @files, '/usr/lib32';
}

# directories to get out of the tempdir
my @tempdirs = qw(mnt proc);

run(qq(/usr/bin/tar -cpf $ballname @files));

mkdir("$tmpdir/$_") for @tempdirs;

run(qq(tar -C $tmpdir -rpf $ballname @tempdirs));
run(qq(xz $ballname));
run(qq(/bin/ls -hl $ballname.xz));


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

