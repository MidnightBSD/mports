#!/usr/local/bin/perl
#
# Copyright (c) 2007 Chris Reinhardt. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright notice
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $MidnightBSD: mports/Tools/magus/slave/magus.pl,v 1.2 2007/10/22 05:59:11 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



#
# todo:	setproctitle
#	

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;
use Sys::Syslog;

$SIG{INT} = sub { die "Caught SIGINT\n" };

main(@ARGV);

=head1 magus.pl

This script is the script that is run on each node.  It sets up the chroot
dir, selects the next port to be built from the master db, copies dependecy
packages to the chroot dir, chroot's to the chroot dir, builds the port,
uploads the resulting package, and reports the results to the master database.

=head2 main()

Top level function.  Sets up logging and starts the main loop.  The general
logic is to keep looping building ports, and if there are no more ports to
build sleep for a while.

=cut

sub main {
  my $lock;
    
  openlog("magus", "ndelay,pid", "local0");
  
  syslog('info', "Starting magus on %s (%s)", $Magus::Machine->name, $Magus::Machine->arch);
  
  while (1) {
    $lock = Magus::Lock->get_ready_lock();
    
    if (!$lock) {
      # there's no more ports to test, sleep for a while and check again.
      syslog('debug', "No ports to build, sleeping $Magus::Config{DoneWaitPeriod}");
      sleep($Magus::Config{DoneWaitPeriod});
      next;
    }
    
    syslog('info', "Starting test run for: %s", $lock->port);
    
    eval { run_test($lock) };
    
    # An exception ($@) was thrown.  Note the internal error and move on.
    if ($@) {
      if ($@ =~ m/Caught SIGINT/) {
        exit 0;
      }
      
      my $error = $@;
      
      syslog('err', "Exception throw building %s: %s", $lock->port, $error);
      
      my $result = $lock->port->current_result;
      
      $result->delete if $result;
      
      $result = $lock->port->add_to_results({
        version => $lock->port->version,
        arch    => $Magus::Machine->arch,
        machine => $Magus::Machine,
        summary => 'internal',
      });
      
      $result->add_to_subresults({
        type => 'internal',
        name => 'ExceptionThrown',
        msg  => "Internal exception thrown: $error"
      });
    }
      
    $lock->delete;
  }
}



=head3 Exiting

Note that all the locks associated with this machine will be deleted at
script exit. If you are running to copies of this script on one machine,
make sure to assign them different machine IDs in the master database.

=cut

END {
  Magus::Lock->search(machine => $Magus::Machine)->delete_all;
}
  

=head2 run_test($lock)

Run the entire test process on the given port (well, the given lock, but the
port is at C<< $lock->port >>).  

=cut

sub run_test {
  my ($lock) = @_;
  
  my $port = $lock->port;
  
  my $chroot = Magus::Chroot->new(tarball => $Magus::Config{ChrootTarBall});

  copy_dep_pkgfiles($lock, $chroot);
  
  # we fork so just the child chroots, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish.
    waitpid($pid, 0);
  } elsif (defined $pid) {
    # Child, chroot and go.
    $SIG{INT} = 'DEFAULT';
    $chroot->do_chroot();
    chdir($port->origin);
    
    my $test    = Magus::PortTest->new(port => $port, chroot => $chroot);
    my $results = $test->run;
  
    insert_results($port, $results);
    
    exit(0);
  } else {
    die "Could not fork: $!\n";
  } 

  # Back to the parent here. 
  if ($? == 0) {
    my $result = $port->current_result;

    if ($result->summary eq 'pass' || $result->summary eq 'warn') {
      upload_pkgfile($port, $chroot);
    }

    syslog('info', "Test run complete for $port; summary: %s", $result->summary);

    return 1;
  } else {
    die "Child exited unexpectantly: $?\n";
  }
}


=head2 copy_dep_pkgfiles($lock, $chroot)

Copies the package files for all the dependancies of the current port into
the package dir in the chroot dir.

=cut

sub copy_dep_pkgfiles {
  my ($lock, $chroot) = @_;
  
  foreach my $depend ($lock->port->depends) {
    
    syslog('debug', "coping $depend package to chroot dir.");
    
    if ($depend->current_result && ($depend->current_result->summary eq 'pass' || $depend->current_result->summary eq 'warn')) {
      # There should be a package that we can use to install the port.
      copy_pkgfile($depend, $chroot);
      next;
    }
    
    
    die "Port was scheduled as ready to build, but a dependancy had not been built successfuly.\n";
    }
  
  return 1;
}
    

=head2 copy_pkgfile($port, $chroot)

Copy a single package file from the master dir to the chroot package dir.

=cut
      
sub copy_pkgfile {
  my ($port, $chroot) = @_;
  
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $arch = $Magus::Machine->arch;
  my $dest = join('/', $chroot->root, $chroot->packages, 'All');
  
  my $cmd = "/usr/bin/scp $Magus::Config{'PkgfilesRoot'}/$arch/$file $dest";
  
  system($cmd) == 0 || die "$cmd failed. (exit $?)\n";
}  
  

=head2 upload_pkgfile($port, $chroot)  
  
Upload the built package of the current port to the master dir.

=cut

sub upload_pkgfile {
  my ($port, $chroot) = @_;

  my $arch = $Magus::Machine->arch;
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
          
  my $cmd = "/usr/bin/scp $from $Magus::Config{'PkgfilesRoot'}/$arch/$file";
  
  system($cmd) == 0 || die "$cmd failed (exit $?)\n";
}  


=head2 insert_results($port, $results)

Takes a port and a the data structure from Magus::PortTester, and then
inserts the results into the database, referencing the current port.

=cut  

sub insert_results {
  my ($port, $results) = @_;
  
  my $res = $port->add_to_results({
    version => $port->version,
    summary => $results->{'summary'},
    machine => $Magus::Machine,
    arch    => $Magus::Machine->arch,
  });
  
  foreach my $sr (@{$results->{'warnings'}}) {
    $res->add_to_subresults({
      type => 'warning',
      %$sr
    });
  }
  
  foreach my $sr (@{$results->{'errors'}}) {
    $res->add_to_subresults({
      type => 'error',
      %$sr
    });
  }
  
  if ($results->{log}) {
    $res->add_to_logs($results->{log});
  }
}
      

1;
__END__

