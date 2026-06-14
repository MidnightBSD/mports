package Magus::PhaseLog;
#
# Copyright (c) 2026 Lucas Holt. All rights reserved.
#

use strict;
use warnings;

use base qw(Magus::DBI);

__PACKAGE__->table('phase_logs');
__PACKAGE__->columns(Essential => qw/id port phase data/);
__PACKAGE__->sequence('phase_logs_id_seq');

__PACKAGE__->has_a(port => 'Magus::Port');

1;
__END__
