#!/usr/bin/perl
#
# $MidnightBSD$
#

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

#
# quick little script to delete results from the db.
#

while (@ARGV) {

  my $result = Magus::Result->retrieve(shift) || die "Couldn't get result!\n";

  $result->delete;
}
