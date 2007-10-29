package Magus::Cluster;
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
# $MidnightBSD: mports/Tools/lib/Magus/Cluster.pm,v 1.1 2007/10/29 06:56:29 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use strict;
use warnings;


sub halt {
  _send_tasks('Wait');
}

sub resume {
  foreach my $task (Magus::Task->search(type => 'Wait', started => 1)) {
    $task->completed(1);
    $task->update;
  }
}


sub run_task {
  my ($type) = @_;
  
  _send_tasks($type);
  
  my $running_count = 1;
  
  while ($running_count > 0) {
    $running_count = Magus::Task->search(type => $type, complete => 0)->count;  
    sleep(5);
  }
}
  
   
sub _send_tasks {
  my ($type) = @_;

  my $count = 0;  
  foreach my $machine (Magus::Machine->retrieve_all) {
    next if $machine->id == $Magus::Machine->id;
  
    Magus::Task->insert({
      machine => $machine,
      type    => $type
    });
    
    $count++;
  }
  
  while (Magus::Task->search(type => $type, started => 1)->count != $count) {
    sleep(1);
  }
}

1;
__END__

