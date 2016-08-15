package Mport::Port;
#
# $MidnightBSD: mports/Tools/lib/Mport/Port.pm,v 1.1 2007/08/15 20:55:39 ctriv Exp $
#
use strict;
use warnings;

use base 'Mport::DBI';

__PACKAGE__->table('ports');
__PACKAGE__->columns(All => qw(name version description license pkgname));
__PACKAGE__->has_many(depends => 'Mport::Depend' => 'port');


sub origin {
  return join('/', $Mport::Globals::ROOT, $_[0]->name);
}

1;
__END__
