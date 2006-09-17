#!/usr/bin/perl
# $FreeBSD: ports/Tools/scripts/release/checkdeps.pl,v 1.1 2002/03/27 00:45:47 will Exp $

die "$0 <pkgdir> <indexfile>\n" if ($#ARGV != 1);

$pkg_dir = shift(@ARGV);

while (<>) {
  chomp;
  @f = split(/\|/);
  @deps = split(/\s+/, $f[8]);
  foreach (@deps) {
    print "$_\n" if (! -f "$pkg_dir/$_.tgz");
  }
}
