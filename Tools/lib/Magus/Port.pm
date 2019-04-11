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
# $MidnightBSD$
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use strict;
use warnings;

use base 'Magus::DBI';

__PACKAGE__->table('ports');

__PACKAGE__->columns(Essential => qw(id run name version status pkgname flavor));
__PACKAGE__->columns(All       => qw(description license restricted www updated));
__PACKAGE__->columns(Stringify => qw(name));

__PACKAGE__->has_a(run => 'Magus::Run');

__PACKAGE__->has_many(depends => [ 'Magus::Depend' => 'dependency' ] => 'port');
__PACKAGE__->has_many(categories => [ 'Magus::PortCategory' => 'category' ]);
__PACKAGE__->has_many(events => 'Magus::Event');


__PACKAGE__->set_sql(ready_ports => 'SELECT __ESSENTIAL__ FROM ready_ports WHERE run=?');
__PACKAGE__->set_sql(single_ready_port => 'SELECT __ESSENTIAL__ FROM ready_ports WHERE run=? LIMIT 1');

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
  return shift->search_single_ready_port($run)->next;
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

Returns a list of every port in this port's dependency tree.

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

=head2 $port->bundle_name

Returns the bundle filename for this port.

=cut

sub bundle_name {
  my ($self) = @_;
  return sprintf("%s-%s.%s", $self->pkgname, $self->version, $Magus::Config{'PkgExtension'});
}



=head2 $port->set_result_pass($message);

A convience method for setting a port as passed.  

=cut

sub set_result_pass {
  my ($self, $msg) = @_;
  
  $self->_set_result('pass', $msg, 'info');
}


=head2 $port->set_result_skip($message);

A convience method for setting a port as skipped.  

=cut

sub set_result_skip {
  my ($self, $msg) = @_;
  
  $self->_set_result('skip', $msg, 'skip');
}


=head2 $port->set_result_internal($message);

A convience method for setting a port as internalled.

=cut

sub set_result_internal {
  my ($self, $msg) = @_;
  
  $self->_set_result('internal', $msg, 'internal');
}


=head2 $port->set_result_fail($message);

A convience method for setting a port as failed. 

=cut

sub set_result_fail {
  my ($self, $msg) = @_;
  
  $self->_set_result('fail', $msg, 'fail');
}



sub _set_result {
  my ($self, $status, $msg, $type) = @_;
  
  $self->status($status);
  $self->update;
   
  $self->note_event($type, $msg);
}

=head2 $port->reset();

Returns the port to a pristine untested state.

=cut

sub reset {
  my ($self) = @_;
  
  $self->events->delete_all;

  if (my $log = Magus::Log->retrieve(port => $self)) {
    $log->delete;
  }

  $self->status('untested');
  $self->update;
}

=head2 $port->can_reset

Returns true is reseting this port makes sense (the port is tested
and its run is active).  Returns false otherwise.

=cut

sub can_reset {
  return if $_[0]->status eq 'untested'
         || $_[0]->run->status ne 'active';
  return 1;
}

=head2 $port->log

Returns the log data for this port, if any.  Returns undef if there is no log.

=cut

sub log {
  require Magus::Log;
  
  my ($self) = @_;
  return $self->{__log} if exists $self->{__log};
  my $log = Magus::Log->retrieve(port => $self) or return;
  return $self->{__log} = $log->data;
}

=head2 $port->note_event(type => $msg);

Add an event to the port of the given type with the given message

=cut

sub note_event {
  my ($self, $type, $msg) = @_;
  
  $self->add_to_events({
    machine => $Magus::Machine,
    type    => $type,
    msg     => $msg,
  });
}
  
1;
__END__
