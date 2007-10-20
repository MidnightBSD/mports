package Magus::Machine;
#
# $MidnightBSD$
#

use strict;
use warnings;
use base qw(Magus::DBI);


__PACKAGE__->table('machines');
__PACKAGE__->columns(Essential => qw/id arch name maintainer/);


1;
__END__

