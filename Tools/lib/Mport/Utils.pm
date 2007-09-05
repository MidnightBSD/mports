package Mport::Utils;
#
# $MidnightBSD: mports/Tools/lib/Mport/Utils.pm,v 1.1 2007/08/15 20:55:39 ctriv Exp $
#
use strict;
use warnings;
use Exporter ();
use Cwd ();
use Text::ParseWords qw(shellwords);

use Mport::Globals qw($MAKE $ROOT);

*import = \&Exporter::import;

our @EXPORT_OK = qw(make_var recurse_ports);

sub make_var {
  my $vars  = join(' ', map { "-V $_" } @_);
  my $ret   = `$MAKE $vars`;
  
  if (wantarray) {
    return shellwords($ret);
  } else {
    return $ret;
  }
}

sub recurse_ports (&) {
  my ($code) = @_;
  my $orig = Cwd::getcwd();
  
  _do_recurse($code, $ROOT);
  
  chdir($orig);
}

sub _do_recurse {
  my ($code, $cwd) = @_;
  
  chdir($cwd);
  
  my @dirs = make_var('SUBDIR');
  
  if (@dirs) {
    foreach my $dir (@dirs) {
      _do_recurse($code, "$cwd/$dir");
    }
  } else {
    $code->($cwd);
  }
}      

1;
__END__
