#!/usr/local/bin/perl
#
# $MidnightBSD: mports/Tools/magus/master/halt_cluster.pl,v 1.1 2007/10/31 18:02:28 ctriv Exp $
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