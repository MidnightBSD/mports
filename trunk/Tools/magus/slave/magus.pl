#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

main(@ARGV);
 
  
sub main {
  my $lock;
    
  eval {
    while (1) {
      $lock = Magus::Lock->get_ready_lock();
      
      if (!$lock) {
        # there's no more ports to test, sleep for a while and check again.
        sleep($Magus::Config{'DoneWaitPeriod'});
        next;
      }
      
      print "Installing: " . $lock->port->name . "\n";
              
      install_depends($lock) || next;
      run_test($lock);
      $lock->delete;
    }
  };

  my $err = $@;
  eval { $lock->delete if defined $lock && ref $lock !~ m/deleted/i; };
  
  die $err if $err;
}


sub install_depends {
  my ($lock) = @_;
  
  foreach my $depend ($lock->port->depends) {
    print "\tDep $depend\n";
    if (!$depend->current_result || $depend->current_result->summary eq 'pass' || $depend->current_result->summary eq 'warn') {
      # There should be a package that we can use to install the port.
      install_package($depend) || last;
      next;
    }
    
    # We got a port that was scheduled ready, but wasn't!
    my $result = $lock->port->add_to_results({
      version => $lock->port->version,
      machine => $Magus::Machine,
      summary => 'fail',
      arch    => $Magus::Machine->arch,
    });
    
    $result->add_to_subresults({
      type   => 'prebuild',
      name   => 'SchedulerFailure',
      msg    => 'Port was schedualed as ready to build, but a dependancy had not been built successfuly.'
    });
    
    return 0;
  }
  
  return 1;
}
    
    
      
sub install_package {
  #
  # we just return 1, cause we're just testing the scheduler.
  #      
  print "\tinstall_package: @_\n";         
  return 1;
}  
  

sub run_test {
  my ($lock) = @_;
  
  sleep(2);

  $lock->port->add_to_results({
   version => $lock->port->version,
   machine => $Magus::Machine,
   summary => 'pass',
   arch    => $Magus::Machine->arch,
  });
}
  
sub real_run_test {
  my ($port) = @_;
  
  my $chroot = Magus::Chroot->new(tarball => $Magus::Config{chroot_tarball});
  
  # we fork so just the child chroots, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish.
    waitpid($pid, 0);
  } elsif (defined $pid) {
    # Child, chroot and go.
    $chroot->do_chroot();
    chdir($port->origin);
    
    my $test    = Magus::PortTest->new(port => $port, chroot => $chroot);
    my $results = $test->run;
  
    insert_results($results);
  } else {
    die "Could not fork: $!\n";
  } 

  # Back to the parent here. 
  if ($? == 0) {
    return 1;
  } else {
    die "Child exited unexpectantly: $?\n";
  }
}




1;
__END__

