package Magus::Config;
#
# Copyright (C) 2025 Lucas Holt
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


use strict;
use warnings;
use YAML qw(LoadFile);
use Sys::Hostname qw(hostname);

our %Config;

sub import {
    no strict 'refs';

    my $caller = caller;

    *{"$caller\::Config"} = \%Config;
}

sub load_config {
    my $file = shift;

    my %filecfg = %{LoadFile($file)};

    %Config = (
        # defaults
        DBHost         => 'localhost',
        DBName         => 'magus',
        DBUser         => 'magus',
        Machine        => hostname(),
        DoneWaitPeriod => 200,
        ChrootTarBall  => '/usr/magus/os.tar.xz',
        DistfilesRoot  => '/mnt/magus/distfiles',
        PkgfilesRoot   => '/mnt/magus/packages',
        PkgExtension   => 'mport',
        MasterDataDir  => 'ftp://stargazer.midnightbsd.org/pub/magus',
        MportsSnapDir  => 'runs',
        VcsRoot        => 'https://github.com/midnightbsd/',
        SlaveSrcDir    => '/usr/src',
        SlavePidFile   => '/var/run/magus.pid',

        # file values override defaults
        %filecfg,
    );

    # More defaults
    $Config{SlaveDataDir} ||= "$Magus::Root/slave-data";
    $Config{SlaveMportsDir} ||= "$Config{SlaveDataDir}/mports";
    $Config{SlaveChrootsDir} ||= "$Config{SlaveDataDir}/chroots";
    $Config{LostDBWaitPeriod} ||= 120;
}

BEGIN {load_config("$Magus::Root/config.yaml")};

1;
__END__

