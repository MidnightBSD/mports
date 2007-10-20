package Magus::SubResult;
#
# $MidnightBSD$
#

use strict;
use warnings;
use base qw(Magus::DBI);

__PACKAGE__->table('subresults');
__PACKAGE__->columns(All => qw/result phase type name msg/);

__PACKAGE__->has_a(result => 'Mport::Result');


1;
__END__

