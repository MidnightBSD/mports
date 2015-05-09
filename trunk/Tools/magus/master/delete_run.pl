#!/usr/bin/perl
#
# $MidnightBSD$

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

#
# quick little script to delete runs from the db.
#

while (@ARGV) {

  my $run = Magus::Run->retrieve(shift) || die "Couldn't get run!\n";

  $run->delete;
}
