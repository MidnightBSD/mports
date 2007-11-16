package Magus::Result;
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
# $MidnightBSD: mports/Tools/lib/Magus/Result.pm,v 1.4 2007/11/07 19:11:46 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use base qw(Magus::DBI);
use strict;
use warnings;


__PACKAGE__->table('results');
__PACKAGE__->columns(All => qw/id port version summary machine/);

__PACKAGE__->has_a(port => 'Magus::Port');
__PACKAGE__->has_a(machine => 'Magus::Machine');
__PACKAGE__->has_many(subresults => 'Magus::SubResult');
__PACKAGE__->might_have(log       => 'Magus::Log' => 'data');


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

