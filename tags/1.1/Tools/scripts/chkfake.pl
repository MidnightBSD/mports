#!/usr/local/bin/perl -l
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
# $MidnightBSD: mports/Tools/scripts/chkfake.pl,v 1.8 2008/03/31 00:06:30 ctriv Exp $
#
# MAINTAINER=   ctriv@MidnightBSD.org
#
# Check a fake install for errors.
#
# usage:  cd $port && make MPORT_MAINTAINER_MODE=yes fake
#
use strict;
use warnings;

my ($plist, $destdir, $prefix) = @ARGV;

my $skip = '';
if ($ARGV[3] && $ARGV[3] eq '-s') {
  $skip = $ARGV[4];
  $skip =~ s/\s+/|/g;
  $skip = qr/^(?:$skip)$/;
}

open(my $fh, '<', $plist) || die "Couldn't open $plist: $!\n";

print "Checking $destdir";

my $cwd = $prefix;
my $ok  = 1;
while (<$fh>) {
  chomp;
  s/\s*$//;
  
  if (m/^@(?:cwd|cd)\s*(.*)/) {
    $cwd = $1 || $prefix;
  }

  next if m/^\@/;
 
  # skip symlinks.
  next if -l "$destdir$cwd/$_";
  
  if (-e "$destdir$cwd/$_") {
    unless (($skip && m/$skip/) || !grep_file($destdir,  "$destdir$cwd/$_")) {
      $ok = 0;
      print "    $_ contains the fake destdir.";
    }
    next;
  }
  
  
  $ok = 0;
  
  if (-e "$cwd/$_") {
    print "    $_ installed in $cwd"
  } else {
    print "    $_ not installed."
  }
}

if ($ok) {
  print "Fake succeeded."
} else {
  print "Fake failed."
}

close($fh) || die "Couldn't close $plist: $!\n";

exit !$ok;

sub grep_file {
  my ($destdir, $file) = @_;
  local $/;
  open(my $fd, '<', $file) || die "Couldn't open $file: $!\n";
  my $contents = <$fd>;
  close($fd) || die "Couldn't close $file: $!\n";
    
  return index($contents, $destdir) >= 0 ? 1 : 0;
}
