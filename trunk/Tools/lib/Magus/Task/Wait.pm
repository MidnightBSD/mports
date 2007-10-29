package Magus::Task::Wait;
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
# $MidnightBSD: mports/Tools/lib/Magus/Task/Wait.pm,v 1.1 2007/10/29 06:56:29 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use base qw(Magus::Task);
use strict;
use warnings;


=head1 Magus::Task::Wait

This task is a special case. All other tasks are started, and once the node
is done, the node marks the task as complete.  The wait task is started, and
the node will sleep until the I<master> marks the task as complete.  This
way the master can halt the cluster as needed.

=cut


sub exec {
  my ($self) = @_;
  
  $self->started(1); $self->update;

  $self->callbacks->{'log'}->("Halted");
  
  while (1) {
    sleep(1);
    
    #
    # Run other tasks
    #
    if (my @torun = Magus::Task->retrieve_from_sql('machine=? AND id!=? AND started=0 AND completed=0', $Magus::Machine, $self->id)) {
      $_->exec for @torun;
    }
    
    if ($self->is_complete) {
      last;
    }
  }
  
  $self->delete;
}




1;
__END__

