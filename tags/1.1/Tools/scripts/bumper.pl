#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Mport::Utils qw(recurse_ports make_var);

use File::Temp qw(tempfile);
use File::Copy qw(move copy);

sub fgrep (&@);

my ($wanted) = @ARGV;

recurse_ports {
  if (make_var($wanted)) {
    print "Bumping $_[0]... ";
    bump_portrevision(shift);
    print "done.\n";
  }
};


sub bump_portrevision {
  my ($port) = @_;

  my $makefile = "$port/Makefile";
  my ($tmp, $tmpname) = tempfile();
  
  if (fgrep { m/PORTREVISION/ } $makefile) {  
    open(my $in, '<', $makefile) || die "Couldn't open $makefile: $!\n";
    
    local $_;
    while (<$in>) {
      if (m/^(PORTREVISION\s*\??=\s*)(\d+)/) {
        $_ = $1 . ($2 + 1) . "\n";
      }
      print $tmp $_;
    }
    close($in) || die "Couldn't close $makefile: $!\n";
  } else {
    open(my $in, '<', $makefile) || die "Couldn't open $makefile: $!\n";
        
    local $_;
    while (<$in>) {
      if (m/PORTVERSION=(\s*)/) {
        $_ .= "PORTREVISION=${1}1\n";
      }
      print $tmp $_;
    }
    
    close($in) || die "Couldn't close $makefile: $!\n";
  }
  close($tmp) || die "Couldn't close $tmpname: $!\n";
  
  move($tmpname, $makefile) || die "Couldn't move $tmpname to $makefile: $!\n";
}
  
  
sub fgrep (&@) {
  my ($code, @files) = @_;
  my ($fh, $ret);

  foreach my $file (@files) {
    open($fh, '<', $file) || die "Couldn't open $file: $!\n";
    while (local $_ = <$fh>) {
      if ($code->()) {
        close($fh) || die "Couldn't close $file: $!\n";
        return 1;
      }
    }
    close($fh) || die "Couldn't close $file: $!\n";
  }
  
  return;
}

