package Mport::Utils;
#
# $MidnightBSD$
#
use strict;
use warnings;
use Exporter ();
use Text::ParseWords qw(shellwords);
use Mport::Globals qw($MAKE);

*import = \&Exporter::import;

our @EXPORT = qw(make_var);

sub make_var {
  my $vars  = join(' ', map { "-V $_" } @_);
  my $ret   = `$MAKE $vars`;
  
  if (wantarray) {
    return shellwords($ret);
  } else {
    return $ret;
  }
}
  


1;
__END__
