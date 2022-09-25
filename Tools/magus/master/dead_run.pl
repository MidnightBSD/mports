#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

#
# quick little script to mark runs dead.
#

while (@ARGV) {

  my $run = Magus::Run->retrieve(shift) || die "Couldn't get run!\n";

  $run->set(status => 'dead');
  $run->update;
}
