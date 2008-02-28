package Magus::Port;
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
# $MidnightBSD: mports/Tools/lib/Magus/Port.pm,v 1.12 2008/02/24 23:58:47 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use strict;
use warnings;

use base 'Magus::DBI';

__PACKAGE__->table('ports');

__PACKAGE__->columns(Essential => qw(id run name version status));
__PACKAGE__->columns(All       => qw(description license www updated));
__PACKAGE__->columns(Stringify => qw(name));

__PACKAGE__->has_a(run => 'Magus::Run');

__PACKAGE__->has_many(depends => [ 'Magus::Depend' => 'dependency' ] => 'port');
__PACKAGE__->has_many(categories => [ 'Magus::PortCategory' => 'category' ]);
__PACKAGE__->has_many(events => 'Magus::Event');


__PACKAGE__->set_sql(ready_ports => 'SELECT __ESSENTIAL__ FROM ready_ports WHERE run=?');


=head2 Magus::Port->get_ready_port($run);

Return a port that is ready to be tested for the given run.
Ready is defined as:

=over 4

=item 1

The port is unlocked

=item 2

The port has not been tested.

=item 3

All the port's depends are tested and unlocked.

=back

=cut

sub get_ready_port {
  my ($class, $run) = @_;
  return shift->search_ready_ports($run)->next;
}
  

=head2 $port->origin

Return the absolute directory where this port lives, such as:
  
  /usr/mports/foo/bar
  
=cut  

sub origin {
  return join('/', $Mport::Globals::ROOT, $_[0]->name);
}


# POD removed as method is deprecated.
sub current_result {
  require Carp;
  Carp::confess("Use of deprecated method: Magus::Port->current_result.  There is no replacement.");
}

=head2 $port->all_depends

Returns a list of every port in this port's depends tree.

=cut 

sub all_depends {
  my ($self) = @_;
 
  my %depends;   
  _walk($self, \%depends);
  delete $depends{$self};
  return sort values %depends;
}    

sub _walk {
  my ($port, $depends) = @_;
  
  foreach my $dep ($port->depends) {
    if (!$depends->{$dep}) {
      $depends->{$dep} = $dep;
      _walk($dep, $depends);
    }
  }
  
}


=head2 $port->set_result_pass($phase => $name => $message);

A convience method for setting a port as passed.  Creates one subresult of
type C<$name>, with message C<$message> in phase C<$phase>.

=cut

sub set_result_pass {
  my ($self, $phase, $name, $msg) = @_;
  
  $self->_set_result('pass', $phase, $name, $msg);
}


=head2 $port->set_result_skip($phase => $name => $message);

A convience method for setting a port as skipped.  Creates one subresult of
type C<$name>, with message C<$message> in phase C<$phase>.

=cut

sub set_result_skip {
  my ($self, $phase, $name, $msg) = @_;
  
  $self->_set_result('skip', $phase, $name, $msg);
}


=head2 $port->set_result_internal($phase => $name => $message);

A convience method for setting a port as internalled.  Creates one subresult of
type C<$name>, with message C<$message> in phase C<$phase>.

=cut

sub set_result_internal {
  my ($self, $phase, $name, $msg) = @_;
  
  $self->_set_result('internal', $phase, $name, $msg);
}


=head2 $port->set_result_fail($phase, $name => $message);

A convience method for setting a port as failed.  Creates one subresult of
type C<$name>, with message C<$message> in phase C<$phase>.

=cut

sub set_result_fail {
  my ($self, $phase, $name, $msg) = @_;
  
  $self->_set_result('fail', $phase, $name, $msg);
}



sub _set_result {
  my ($self, $status, $phase, $name, $msg) = @_;
  
  $self->status($status);
  $self->update;
    
  $self->add_to_events({
    machine   => $Magus::Machine,
    type  => $status,
    name  => $name,
    msg   => $msg,
    phase => $phase,
  });
}




1;
__END__
