#!/usr/bin/perl
#
# $MidnightBSD: mports/Tools/magus/master/nuke_internals.pl,v 1.1 2008/04/22 06:54:49 ctriv Exp $
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
