package Mport::Globals;
#
# $MidnightBSD$
#


use strict;
use warnings;
use Exporter ();

*import = \&Exporter::import;

our @EXPORT = qw($ROOT $INDEX $MAKE);

our $MAKE  = '/usr/bin/make';
our $ROOT  = '/usr/mports';
our $INDEX = "$ROOT/INDEX.db";

1;
__END__
