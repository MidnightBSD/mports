package Magus::OutcomeRules::Base;
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
# $MidnightBSD: mports/Tools/lib/Magus/OutcomeRules/Base.pm,v 1.5 2007/11/02 18:43:43 ctriv Exp $
#
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;
use Attribute::Handlers;

use Fcntl qw(:seek);
use base qw(Class::Data::Inheritable);


=head1 NAME 

Magus::OutcomeRules

=head1 SYNOPSIS

  
=head1 DESCRIPTION

This module contains the individual rules used to analyze the output of a port.

=cut


__PACKAGE__->mk_classdata('error_rules');
__PACKAGE__->mk_classdata('warning_rules');



#
# __PACKAGE__->fail($msg, $code)
#


sub error :ATTR(CODE) {
  my ($class, $sym, $code) = @_;
  
  my $rules = $class->error_rules;
  (my $phase = $class) =~ s/^.*:://;
  
  my $entry = {
    name  => *$sym{NAME}, # evil grin :->
    phase => $phase,
    code  => $code,
  };
  
  push(@$rules, $entry);
  
  $class->error_rules($rules);
}

sub warning :ATTR(CODE) {
  my ($class, $sym, $code) = @_;
  
  my $rules = $class->warning_rules;
  (my $phase = $class) =~ s/^.*:://;
  
  my $entry = {
    name  => *$sym{NAME}, # evil grin :->
    phase => $phase,
    code  => $code,
  };
  
  push(@$rules, $entry);
  
  $class->warning_rules($rules);
}

sub execute {
  my ($class, $output) = @_;
  
  my %result = (
    summary => 'pass'   
  );
  
  local $_ = $$output;
  
  foreach my $rule (@{$class->warning_rules || []}) {
    if (my $msg = $rule->{code}->()) {
      $result{summary} = 'warn' if $result{summary} eq 'pass';
      push(@{$result{warnings}}, {
        phase => $rule->{phase},
        msg   => $msg,
        name  => $rule->{name},
      });
    }
  }

  foreach my $rule (@{$class->error_rules || []}) {
    if (my $msg = $rule->{code}->()) {
      $result{summary} = 'fail';
      push(@{$result{errors}}, {
        phase => $rule->{phase},
        msg   => $msg,
        name  => $rule->{name},
      });
    }
  }
  
  return \%result;
}




1;
__END__

