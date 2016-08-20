#!/usr/bin/perl
#
# $MidnightBSD: trunk/Tools/magus/master/top_blockers.pl 18885 2015-05-09 18:58:21Z laffer1 $
# Prints out all depends for a port on a given run (but not type)
use strict;
use warnings;
use Data::Dumper;
use lib qw(/usr/mports/Tools/lib);

use Magus;

my $run = shift || die "Usage: $0 <run ID> <pkg>\n";
my $pkg = shift || die "Usage: $0 <run ID> <pkg>\n";
my %blocking;
my %objs;

my $ports = Magus::Port->search(run => $run, pkgname => $pkg);

$|++;

while (my $port = $ports->next) {
  my $add = $blocking{$port} || 1;
  $objs{$port} ||= $port;

  print "$port\n";

  foreach my $dep ($port->all_depends) {
#print Dumper($dep);	
    print "------$dep\n"; 
  }    
}

print '-' x 79, "\n";
