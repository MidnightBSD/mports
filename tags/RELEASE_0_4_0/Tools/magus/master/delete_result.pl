#!/usr/bin/perl
#
# $MidnightBSD: mports/Tools/magus/master/delete_result.pl,v 1.1 2007/10/24 00:31:41 ctriv Exp $
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
