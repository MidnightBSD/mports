package Magus::Task::UpdateMports;
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
# $MidnightBSD: mports/Tools/lib/Magus/Task/UpdateMports.pm,v 1.2 2007/10/29 17:07:45 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use base qw(Magus::Task);
use strict;
use warnings;

use File::Path qw(rmtree);

=head1 Magus::Task::UpdateMports

This task updates /usr/mports, using C<MasterMportsTarBall>.

=cut



sub exec {  
  my ($self) = @_;

  $self->started(1); $self->update;
  
  $self->callbacks->{'log'}->('Updating mports tree');
  
  chdir("/usr") || die "Couldn't CD to user: $!";
  
  my $scp = "/usr/bin/scp $Magus::Config{MasterMportsTarBall} $Magus::Config{MportsTarBall}";
  system($scp) == 0 || die "$scp returned non-zero: $?";  

  rmtree("mports") || die "Couldn't delete /usr/mports: $!";
  
  my $tar = "/usr/bin/tar xf $Magus::Config{MportsTarBall}";
  system($tar) == 0 || die "$tar returned non-zero: $?";
  
  $self->callbacks->{'log'}->("Restarting process.");
  $self->callbacks->{'restart'}->();
}


1;
__END__

