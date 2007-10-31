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
# $MidnightBSD: mports/Tools/magus/master/update_cluster.pl,v 1.1 2007/10/29 06:53:31 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#


use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;
use Mport::Utils qw(recurse_ports);

#
# The basic outline of the update is this:
# 1) Update the MportsCvs dir.
# 2) Make a new MportsTarball from 1)
# 3) Halt the cluster
# 4) Have all the nodes start MportsUpdate task.  They will download the tarball and extract it
#    They will also mark their chroot dirs as dead, because the lookback needs to be remounted.
# 5) Build or update the index.
# 6) Resume the cluster.
#

main();

sub main {
  update_cvs_dir();
  make_tarball();

  Magus::Cluster::halt();

  Magus::Cluster::run_task('UpdateMports');

  Magus::Index->sync();
  
  Magus::Cluster::resume();
}


sub update_cvs_dir {
  #
  # Hrrrm...
  #
}


sub make_tarball {
  unlink($Magus::Config{'MportsTarBall'}) 
    || ($! !~ m/no such/i && die "Couldn't unlink $Magus::Config{'MportsTarBall'}: $!\n");
  chdir($Magus::Config{'MasterDataDir'})  || die "Couldn't cd to $Magus::Config{'MasterDataDir'}: $!\n";
  
  my $tar = "/usr/bin/tar cfj $Magus::Config{MportsTarBall} $Magus::Config{MportsCvsDir}";
  
  system($tar) == 0 || die "$tar returned non-zero: $?\n";
}


