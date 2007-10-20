package Magus::Result;
#
# $MidnightBSD$
#

use base qw(Magus::DBI);
use strict;
use warnings;


__PACKAGE__->table('results');
__PACKAGE__->columns(All => qw/id port version summary machine arch/);

__PACKAGE__->has_a(port => 'Magus::Port');
__PACKAGE__->has_a(machine => 'Magus::Machine');
__PACKAGE__->has_many(subresults => 'Magus::SubResult');


1;
__END__

