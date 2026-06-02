package Magus::PhaseResult;
#
# Copyright (c) 2026 Lucas Holt. All rights reserved.
#

use strict;
use warnings;

use base qw(Magus::DBI);
use Magus::Phase ();

__PACKAGE__->table('port_phase_results');
__PACKAGE__->columns(Essential => qw/id port phase status/);
__PACKAGE__->columns(All       => qw/machine started finished updated/);
__PACKAGE__->sequence('port_phase_results_id_seq');

__PACKAGE__->has_a(port    => 'Magus::Port');
__PACKAGE__->has_a(machine => 'Magus::Machine');

sub phase_names {
  return Magus::Phase->names;
}

sub ensure_for_port {
  my ($class, $port) = @_;

  foreach my $phase ($class->phase_names) {
    $class->retrieve(port => $port, phase => $phase) || $class->insert({
      port   => $port,
      phase  => $phase,
      status => 'untested',
    });
  }
}

sub mark_nonbuild_skip {
  my ($class, $port) = @_;

  foreach my $phase ($class->phase_names) {
    next if $phase eq 'build';
    my $result = $class->retrieve(port => $port, phase => $phase) || $class->insert({
      port   => $port,
      phase  => $phase,
      status => 'untested',
    });
    $result->status('skip');
    $result->update;
  }
}

sub set_status {
  my ($self, $status, $machine) = @_;

  my $machine_id = $machine ? $machine->id : undef;
  my $dbh = $self->db_Main;

  $dbh->do(
    q{
      UPDATE port_phase_results
         SET status = ?,
             machine = CASE WHEN ? = 'untested' THEN NULL ELSE ? END,
             updated = CURRENT_TIMESTAMP,
             started = CASE
                         WHEN ? = 'running' THEN CURRENT_TIMESTAMP
                         WHEN ? = 'untested' THEN NULL
                         ELSE started
                       END,
             finished = CASE
                          WHEN ? = 'running' THEN NULL
                          WHEN ? = 'untested' THEN NULL
                          ELSE CURRENT_TIMESTAMP
                        END
       WHERE id = ?
    },
    undef,
    $status,
    $status,
    $machine_id,
    $status,
    $status,
    $status,
    $status,
    $self->id,
  );

  $self->refresh;
}

1;
__END__
