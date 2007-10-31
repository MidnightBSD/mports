#!/usr/local/bin/perl
#
# $MidnightBSD$
#

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

$Magus::Machine = Magus::Machine->retrieve(name => 'master');

Magus::Cluster::resume();
