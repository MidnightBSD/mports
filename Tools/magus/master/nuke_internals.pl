#!/usr/bin/perl
#
# $MidnightBSD$
#
use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

foreach my $run (@ARGV) {
  my $ports = Magus::Port->search(run => $run, status => 'internal');

  while (my $port = $ports->next) {
    $port->reset;
  }
}
