#!/usr/local/bin/perl
#
# $MidnightBSD: mports/Tools/magus/master/halt_cluster.pl,v 1.1 2007/10/31 18:02:28 ctriv Exp $
#
use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

my $run = shift || die "Usage: $0 <run ID>\n";
my %blocking;

my $ports = Magus::Port->search(run => $run, status => 'untested');

$|++;

while (my $port = $ports->next) {
  print "$port... ";
  note_failures($port, \%blocking);
  print "done\n";
}

print '-' x 79, "\n";

foreach my $port (sort { $blocking{$b} <=> $blocking{$a} } keys %blocking) {
  print "$port: $blocking{$port}\n";
}

sub note_failures {
  my ($port, $blocking) = @_;
  
  my @depends = $port->depends;
  
  $blocking->{$_}++ for grep { $_->status eq 'fail' || $_->status eq 'skip' } @depends;
  
  note_failures($_, $blocking) 
    for grep { $_->status eq 'untested' } @depends;
}
  
    
  
  
  
