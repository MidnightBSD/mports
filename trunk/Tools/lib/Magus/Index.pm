package Magus::Index;
#
# $MidnightBSD: mports/Tools/lib/Magus/Index.pm,v 1.1 2007/10/19 04:35:58 ctriv Exp $
#
use strict;
use warnings;

use base 'Mport::Index';
  
  
sub create_db {
  my ($class) = @_;
  
  return DBI->connect(
    "DBI:mysql:database=$Magus::Config{DBName}:host=$Magus::Config{DBHost}",
    $Magus::Config{DBUser},
    $Magus::Config{DBPass},
    { RaiseError => 1, PrintError => 0 },
  );
}  
  

sub insert_depends {
  my ($class, $port, $dbh) = @_;
  
  # We only have one depend type, merge into a unique list
  my %depends;
  while (my ($type, $deps) = each %{$port->{'depends'}}) {
    foreach my $dep (@$deps) {
      $depends{$dep}++;
    }
  }
  
  foreach my $dep (keys %depends) {
    Magus::Depend->insert({port => $port->{'name'}, dependency => $dep});
  }
}  
       

   
1;
__END__
 