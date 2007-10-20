package Mport::Depend;
#
# $MidnightBSD: mports/Tools/lib/Mport/Depend.pm,v 1.1 2007/09/11 02:33:03 ctriv Exp $
#
use strict;
use warnings;

use base 'Mport::DBI';


__PACKAGE__->table('depends');
__PACKAGE__->columns(All => qw(port type dependency));
__PACKAGE__->has_a(port => 'Mport::Port');
__PACKAGE__->has_a(dependency => 'Mport::Port');


1;
__END__
