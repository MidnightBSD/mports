package Magus::OutcomeRules;
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
# $MidnightBSD$
#
# MAINTAINER=   ctriv@MidnightBSD.org
#


=head1 fetch rules

=cut

package Magus::OutcomeRules::fetch;

use base qw(Magus::OutcomeRules::Base);

sub FetchFailed :error {
  m/Couldn't fetch it/ && return "Fetch failed.";
}


=head1 extract rules

=cut

package Magus::OutcomeRules::extract;

use base qw(Magus::OutcomeRules::Base);



=head1 patch rules

=cut

package Magus::OutcomeRules::patch;

use base qw(Magus::OutcomeRules::Base);

sub NoLicense :warning {
  m/LICENSE not set/ && return "LICENSE is not set.";
}

sub EmptyLicense :warning {
  m/empty license/ && return "LICENSE is empty.";
}

sub InvalidLicense :warning {
  m/Invalid LICENSE: (\S+)/ && return "Invalid license set: $1";
}

=head1 configure rules

=cut

package Magus::OutcomeRules::configure;

use base qw(Magus::OutcomeRules::Base);



=head1 build rules

=cut

package Magus::OutcomeRules::build;

use base qw(Magus::OutcomeRules::Base);


=head1 fake rules

=cut

package Magus::OutcomeRules::fake;

use base qw(Magus::OutcomeRules::Base);

sub IncompleteInstall :error {
  m/^\s+.* not installed.$/m
    && return "A file in the plist wasn't installed in the fake dir or the final dir.";
}

sub FakeDestdirInFile :error {
  m/contains the fake destdir./s 
    && return "A file contained the fake destdir.";
}

sub FakedOutsideDestdir :error {
  m:^    .* installed in /:m
    && return "A file was installed in the final dir instead of the fake dir.";
}



=head1 package rules

=cut

package Magus::OutcomeRules::package;

use base qw(Magus::OutcomeRules::Base);



=head1 install rules

=cut

package Magus::OutcomeRules::install;

use base qw(Magus::OutcomeRules::Base);

sub AlreadyInstalled :error {
  m:package .*? or its older version already installed: &&
    return "The package was already installed.  This is an error in magus, not the port.";
}

=head1 deinstall rules

=cut

package Magus::OutcomeRules::deinstall;

use base qw(Magus::OutcomeRules::Base);



=head1 reinstall rules

=cut

package Magus::OutcomeRules::reinstall;

use base qw(Magus::OutcomeRules::Base);


=head1 test rules

= cut

package Magus::OutcomeRules::test;
use base qw(Magus::OutcomeRules::Base);
    

1;
__END__

