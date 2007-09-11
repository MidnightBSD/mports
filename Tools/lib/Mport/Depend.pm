package Mport::Depend;
#
# $MidnightBSD: mports/Tools/lib/Mport/Port.pm,v 1.1 2007/08/15 20:55:39 ctriv Exp $
#
use strict;
use warnings;

use base 'Mport::DBI';


__PACKAGE__->table('depends');
__PACKAGE__->columns(All => qw(port type dependancy));
__PACKAGE__->has_a(port => 'Mport::Port');
__PACKAGE__->has_a(dependancy => 'Mport::Port');


1;
__END__
