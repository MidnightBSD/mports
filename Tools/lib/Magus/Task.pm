package Magus::Task;
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
# $MidnightBSD: mports/Tools/lib/Magus/Result.pm,v 1.3 2007/10/23 03:58:51 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use base qw(Magus::DBI);
use strict;
use warnings;

use Magus::Task::Wait         ();
use Magus::Task::UpdateMports ();


__PACKAGE__->table('results');
__PACKAGE__->columns(All => qw/machine type completed/);

__PACKAGE__->has_a(machine => 'Magus::Machine');

sub construct {
  my ($class, @args) = @_;
  
  my $self = $class->SUPER::construct(@args);
  
  bless $self, ref $self . "::" . $self->type;
  
  return $self;
}

__PACKAGE__->mk_classdata('callbacks');

sub set_callbacks {
  my ($class, %cbs) = @_;
  
  $class->callbacks = \%cbs;
}

sub is_complete {
  my ($self) = @_;
  
  my $dbh   = $self->db_Main();
  my $table = $self->table;
  my $id    = $self->id;
  
  my ($complete) = $dbh->selectrow_array("SELECT completed FROM $table WHERE id=?", undef, $id);
  return $complete;
}




1;
__END__

