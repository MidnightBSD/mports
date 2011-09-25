#!/usr/bin/perl
#
# $MidnightBSD$
# warning: when using this, use cvs update -ko to get the file without
# the keyword expansion which breaks the code below.

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Mport::Utils qw(recurse_ports);

my @oldports;

recurse_ports {
  open(my $fh, '<', 'Makefile') || die "Couldn't open Makefile: $!\n";
  
  my $port;
  while (my $line = <$fh>) {
    # $MidnightBSD: mports/Makefile,v 1.40 2009/01/20 15:32:52 laffer1 Exp $
    next unless $line =~ m/\$MidnightBSD: (\S+) (\S+) (\S+) (\S+) (\S+) \S+ \$/;
    
    $port = {
      file => $1,
      version => $2,
      date => [ split(m:/:, $3) ],
      time => [ split(m/:/, $4) ],
      user => $5,
    };
  }
  
  if (!$port) {
    warn "$_[0] does not have a rcs id!!!!\n";
    return;
  }
  
  return if $port->{date}->[0] == 2011
             || ($port->{date}->[0] == 2010 && $port->{date}->[1] > 8);
    
  push(@oldports, $port);
};

foreach my $port (sort { ($a->{date}->[0] <=> $b->{date}->[0]) || ($a->{date}->[1] <=> $b->{date}->[1]) } @oldports) {
  my $date = join('/', @{$port->{date}});
  print "$port->{file}: $date\n";
}
  
  
    
