package Magus::Lock;
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


use base qw(Magus::DBI);
use strict;
use warnings;

__PACKAGE__->table('locks');
__PACKAGE__->columns(Essential => qw(id port machine));

__PACKAGE__->has_a(machine => "Magus::Machine");
__PACKAGE__->has_a(port    => "Magus::Port");

__PACKAGE__->set_sql(by_run => <<'END_OF_SQL');
SELECT locks.* FROM locks,ports WHERE port=ports.id AND ports.run=?
END_OF_SQL

sub get_ready_lock {
  my ($class, $run) = @_;

  my $lock;
  my $port;
  
  while (!defined $lock) {
    my $port = Magus::Port->get_ready_port($run);
   
    if (!$port) { # we ran thru all the ports...
      return;
    }
    
    $lock = $class->_get_lock($port);
  }
  
  return $lock;
}


sub _get_lock {
  my ($class, $port) = @_;
  my $lock;
  
  eval {
    $lock = $class->insert({
      port    => $port,
      machine => $Magus::Machine,
    });
  };
  
  if ($@) {
    if ($@ =~ m/duplicate/i) {
      return;
    } else {
      die $@;
    }
  }
  
  return $lock;
}

#
# depreacted method
#
use Carp qw(cluck);
sub arch {
  my ($self) = @_;
  cluck("Use of deprecated method: " . ref $self . "->arch. Use ->machine->arch instead.");
  return $self->machine->arch;
}

1;
__END__

