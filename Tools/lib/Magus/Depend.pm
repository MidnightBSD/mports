package Magus::Depend;
#
# $MidnightBSD: mports/Tools/lib/Mport/Depend.pm,v 1.1 2007/09/11 02:33:03 ctriv Exp $
#
use strict;
use warnings;

use base 'Magus::DBI';


__PACKAGE__->table('depends');
__PACKAGE__->columns(Primary => qw(port dependency));
__PACKAGE__->has_a(dependency => 'Magus::Port');


1;
__END__
