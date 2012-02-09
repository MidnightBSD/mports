package Magus::Config;
#
# Copyright (c) 2007,2008 Chris Reinhardt. All rights reserved.
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
# $MidnightBSD: mports/Tools/lib/Magus/Config.pm,v 1.8 2008/10/02 23:32:03 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#


use strict;
use warnings;
use YAML qw(LoadFile);

our %Config;


sub import {
  no strict 'refs';
  
  my $caller = caller;

  *{"$caller\::Config"} = \%Config;
}

sub load_config {
  %Config = (
    # defaults
    CvsFlags       => '',
    CvsRoot        => '/home/cvs',
    SlaveSrcDir    => '/usr/src',
    SlavePidFile   => '/var/run/magus.pid',
    %{ LoadFile(shift) },
  );
  
  # More defaults
  $Config{SlaveDataDir}     ||= "$Magus::Root/slave-data";
  $Config{SlaveMportsDir}   ||= "$Config{SlaveDataDir}/mports";
  $Config{SlaveChrootsDir}  ||= "$Config{SlaveDataDir}/chroots"; 
  $Config{LostDBWaitPeriod} ||= 120;
}

BEGIN { load_config("$Magus::Root/config.yaml") };


1;
__END__

