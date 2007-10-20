package Magus::Lock;
#
# $MidnightBSD$
#

use base qw(Magus::DBI);
use strict;
use warnings;

__PACKAGE__->table('locks');
__PACKAGE__->columns(Essential => qw(id port arch machine));

__PACKAGE__->has_a(machine => "Magus::Machine");
__PACKAGE__->has_a(port    => "Magus::Port");


sub get_ready_lock {
  my ($class, $port) = @_;
  
  if (defined $port) {
    return $class->_get_lock($port);
  } else {
    return $class->_find_and_lock_unlocked_port();
  }
}


sub _get_lock {
  my ($class, $port) = @_;
  my $lock;
  
  eval {
    $lock = $class->insert({
      port    => $port,
      machine => $Magus::Machine,
      arch    => $Magus::Machine->arch
    });
  };
  
  if ($@) {
    if ($@ =~ m/duplicate/i) {
      return;
    } else {
      die $@;
    }
  }
  
  return $lock;
}

sub _find_and_lock_unlocked_port {
  my ($class) = @_;
  
  my $lock;
  my $port;
  
  while (!defined $lock) {
    my $port = Magus::Port->get_ready_port;
   
    if (!$port) { # we ran thru all the ports...
      return;
    }
    
    $lock = $class->_get_lock($port);
  }
  
  return $lock;
}

1;
__END__

