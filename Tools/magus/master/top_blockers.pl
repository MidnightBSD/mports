#!/usr/bin/env perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

my $run = shift || die "Usage: $0 <run ID>\n";
my %blocking;
my %objs;

my $ports = Magus::Port->search(run => $run, status => 'untested');

$|++;

while (my $port = $ports->next) {
  my $add = $blocking{$port} || 1;
  $objs{$port} ||= $port;

  foreach my $dep ($port->depends) {
    next unless $dep->status =~ /^(fail|skip|untested)$/;
    
    $objs{$dep}    ||= $dep;
    $blocking{$dep} += $add;
  }    
}

print '-' x 79, "\n";

foreach my $port (sort { $blocking{$b} <=> $blocking{$a} }
  grep { $objs{$_}->status ne 'untested'}
  keys %blocking) {
  next if $objs{$port}->status eq 'untested';
  print "$port: $blocking{$port}\n";
}

  
  
  
