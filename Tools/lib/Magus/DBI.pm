package Magus::DBI;

use strict;
use warnings;
use base 'Class::DBI';


__PACKAGE__->connection(
  "DBI:mysql:database=$Magus::Config{DBName}:host=$Magus::Config{DBHost}", 
  $Magus::Config{DBUser},
  $Magus::Config{DBPass}
);


1;
__END__
