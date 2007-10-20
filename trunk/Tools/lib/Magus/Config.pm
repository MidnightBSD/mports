package Magus::Config;
#
# $MidnightBSD$
# 

use strict;
use warnings;
use YAML qw(LoadFile);

our %Config = ( load_config("$Magus::Root/config.yaml") );

sub import {
  no strict 'refs';
  
  my $caller = caller;
  
  *{"$caller\::Config"} = \%Config;
}

sub load_config {
  %Config = %{ LoadFile(shift) };
}

1;
__END__

