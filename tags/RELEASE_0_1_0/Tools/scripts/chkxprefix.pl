#!/usr/bin/perl
#
# chkxprefix.pl -- A simple script to check if a port and its dependancies have
# a prefix of /usr/X11R?  
#
# By Chris Reinhardt ctriv@MidnightBSD.org
#
# $MidnightBSD: mports/Tools/scripts/chkxprefix.pl,v 1.1 2007/03/20 16:02:01 ctriv Exp $

use strict;
use warnings;

my $portbase  = '/usr/mports';
my $badprefix = qr:^/usr/X11:;


# These are the ports that are allowed in /usr/X11R?
my @allowed   = qw(
	x11/xorg-libraries
	x11/xorg-clients
	x11/xorg-documents
	x11/xorg-manpages
	x11-fonts/xorg-fonts-100dpi
	x11-fonts/xorg-fonts-75dpi
	x11-fonts/xorg-fonts-cyrillic
	x11-fonts/xorg-fonts-miscbitmaps
	x11-fonts/xorg-fonts-truetype
	x11-fonts/xorg-fonts-type1
	x11-servers/xorg-fontserver
	x11-servers/xorg-nestserver
	x11-servers/xorg-vfbserver
	x11-servers/xorg-printserver
	x11-servers/xorg-server
	graphics/dri
	devel/imake-6
	x11-fonts/fontconfig
	x11-fonts/libXft
	x11/xterm
	x11-fonts/xorg-fonts-encodings
	x11-fonts/bitstream-vera
); 

#
#
# End of configuration
###########################################################################

# don't buffer stdout
$|++;

my %allowed = map { + "$portbase/$_", 1 } @allowed;

if (@ARGV && $ARGV[0] eq '-a') {
  check_all();
  exit 0;
}

my $port = shift || die "Usage: check_prefix.pl <port>";

chdir("$portbase/$port") || die "Error: couldn't chdir to '$portbase/$port\n";

my @deps = `make all-depends-list`;
unshift(@deps, "$portbase/$port");

for (@deps) {
  chomp($_);

  check_port($_) 
}

sub check_port {
  local $_ = shift;
  
  chdir($_) || die "Error: couldn't chdir to '$_'\n";
  
  chomp(my $prefix = `make -V PREFIX`);
  
  if ($prefix =~ $badprefix && !$allowed{$_}) {
    print "$_ has prefix $prefix\n";
  }
}


sub check_all {
  open(my $index, '<', "$portbase/INDEX-6") || die "Couldn't open index file.\n";
  
  while (<$index>) {
    my ($port, $path, $prefix) = split(m/\|/, $_);
    
    if ($prefix =~ $badprefix && !$allowed{$path}) {
      print "$path has prefix $prefix\n";
    }
  }
  
  close($index);
}
          
    
    