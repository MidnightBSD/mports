#!/usr/bin/perl
# 
# $MidnightBSD$

=head1 make_ftp_symlinks.pl mport_tree ftp_dir

Makes the symlinks for the ftp site.  Takes the absolute path to the mports tree
you want to base this off of, and the absolute path to the ftp files.  

It is assumed that your packages are in ftp_dir/All

=cut

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Mport::Utils qw(recurse_ports);

# autoflush stdout
$|++;

my $root   = shift;
my $ftpdir = shift;


($root && $ftpdir) || die "Usage: $0 <mports tree> <ftp packages dir>\n";

recurse_ports {
  my $port = shift;

  print "==> Making links for $port...\n";
  system("make PACKAGES=$ftpdir package-links");
};


