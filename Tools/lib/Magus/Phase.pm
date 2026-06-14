package Magus::Phase;
#
# Copyright (c) 2026 Lucas Holt. All rights reserved.
#

use strict;
use warnings;

my @PHASES = qw(fetch build test scan);
my %VALID_PHASE = map { $_ => 1 } @PHASES;

sub names {
  return @PHASES;
}

sub nonbuild_names {
  return grep { $_ ne 'build' } @PHASES;
}

sub default_worker_order {
  return qw(build fetch scan test);
}

sub is_valid {
  my ($class, $phase) = @_;

  return defined $phase && $VALID_PHASE{$phase};
}

1;
__END__
