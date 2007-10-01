package Mport::Utils;
#
# $MidnightBSD: mports/Tools/lib/Mport/Utils.pm,v 1.3 2007/09/09 02:20:48 ctriv Exp $
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
  
  chdir($cwd) || die "Couldn't chdir to $cwd: $!\n";
  
  # Calling make is expensive.  Only do so if we need to.
  if (-e 'pkg-descr' || -e 'pkg-plist') {
    return $code->($cwd);
  }
  
  # it is actually much faster to check if it is a dir makefile than to call
  # make and ask.
  open(my $make, '<', "Makefile") || die "Couldn't open $cwd/Makefile: $!\n";
  while (<$make>) {
    if (m/bsd.port.subdir.mk/) {
      my @dirs = make_var('SUBDIR');
      # close the filehandle before we recurse.
      close($make);
      if (@dirs) {
        foreach my $dir (@dirs) {
          _do_recurse($code, "$cwd/$dir");
        }
      }   
     
      # we're done with this makefile.
      return; 
    }
  }
  
  # must be a real port!  
  close($make);
  $code->($cwd);
}      

1;
__END__
