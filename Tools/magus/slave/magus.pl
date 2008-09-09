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
# $MidnightBSD: mports/Tools/magus/slave/magus.pl,v 1.19 2008/03/14 19:20:31 ctriv Exp $
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
use POSIX qw(setsid);
use Getopt::Std qw(getopts);
use File::Path qw(rmtree);

$SIG{INT} = sub { report('info', "$$: caught sigint"); die "Caught SIGINT $$\n" };

my @origARGV = @ARGV;
my $self     = '/usr/mports/Tools/magus/slave/magus.pl';
my $Lock;

while (1) {
  eval {
    main();
    exit(0);
  };
  
  if ($@) {
    # Check ping in case a dropped DB caused some other exception.
    if ($@ =~ m/DBI/ || !Magus::DBI->ping) {
      while (1) {
        report(err => "Could not connect to database ($@) waiting $Magus::Config{'DoneWaitPeriod'} seconds");
        sleep($Magus::Config{'DoneWaitPeriod'});
        last if Magus::DBI->ping;
      }

      if ($Lock) {
        $Lock->port->reset;
        $Lock->delete;
      }
      # back up to the main() call we go.
    } else {
      die $@;
    }
  }
}

=head1 magus.pl

This script is the script that is run on each node.  It sets up the chroot
dir, selects the next port to be built from the master db, copies dependecy
packages to the chroot dir, chroot's to the chroot dir, builds the port,
uploads the resulting package, and reports the results to the master database.

=head1 OPTIONS

=over 4

=item -f

Stay in the forground (don't daemonize).

=item -v 

Verbose mode, print lots of status information to stdout.

=back

=head2 main()

Top level function.  Sets up logging and starts the main loop.  The general
logic is to keep looping.  If we have an active run, we want to work on ports
from that run, as long as there are ports.

=cut

my %opts;


sub main {
  my $lock;
  
  getopts('fv', \%opts);
  
  daemonize() unless $opts{f};
      
  report('info', "Starting magus on %s (%s)", $Magus::Machine->name, $Magus::Machine->arch);
  
  while (1) {
    my $run = get_current_run($Magus::Machine);
  
    if (!$run || !($lock = Magus::Lock->get_ready_lock($run))) {
      # there's no more ports to test, sleep for a while and check again.
      report('debug', "No ports to build, sleeping $Magus::Config{DoneWaitPeriod} seconds.");
      sleep($Magus::Config{DoneWaitPeriod});
      next;
    }
    
    # stick the current lock in the global, so we can flush it if need be.
    $Lock = $lock;
    
    report('info', "Starting test run for: %s", $lock->port);
    
    run_test($lock);
    
    report('info', 'Run completed for:     %s', $lock->port);
    
    $lock->delete;
    undef $Lock;
  }
}



=head3 Exiting

Note that all the locks associated with this machine will be deleted at
script exit. 

=cut

END {
  if ($Lock) {
    $Lock->port->reset;
    $Lock->delete;
  }
}
  

=head2 run_test($lock)

Run the entire test process on the given port (well, the given lock, but the
port is at C<< $lock->port >>).  

=cut

sub run_test {
  my ($lock) = @_;
  #
  # we have a few eval blocks here, because we want to be sure that the 
  # exception will not allow the child to go to the main program logic.
  #
  my ($port, $chroot);

  $lock->port->note_event(info => "Test started.");

  eval {
    $port = $lock->port;
    $chroot = Magus::Chroot->new(tarball => $Magus::Config{ChrootTarBall});

    copy_dep_pkgfiles($lock, $chroot);
  };
  
  if (my $error = $@) {
    handle_exception($error, $lock);
    return;
  }
  
  # we fork so just the child chroots, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish, and if we get sigint
    # while we are waiting, we stop the child and then cleanup
    local $SIG{INT} = sub { 
      waitpid($pid, 0);
      handle_exception("Caught SIGINT", $lock);
      exit(1);
    };
    
    waitpid($pid, 0);
  } elsif (defined $pid) {
    # child here; chroot and test the port
    eval {
      $chroot->do_chroot();
      chdir($port->origin);
    
      my $test = Magus::PortTest->new(port => $port, chroot => $chroot);
      report('info', "Building $port");
      my $results = $test->run;
  
      insert_results($port, $results);
    };
    
    if ($@ && $@ !~ m/DBI/) {
      handle_exception($@, $lock);
    }
    
    exit(0);
  } else {
    die "Could not fork: $!\n";
  } 

  # Back to the parent here
  if ($? == 0) {
    # update our port object with new data from the database, as the child
    # process probably changed stuff
    $port->refresh;
    
    eval {
      if ($port->status eq 'pass' || $port->status eq 'warn') {
        upload_pkgfile($port, $chroot);
      }
    };
    
    if ($@) {
      handle_exception($@, $lock);
    }
  } else {
    die "Child exited unexpectantly: $?\n";
  }
  
  $port->note_event($port->status => "Test complete.");
}


=head2 copy_dep_pkgfiles($lock, $chroot)

Copies the package files for all the dependancies of the current port into
the package dir in the chroot dir.

=cut

sub copy_dep_pkgfiles {
  my ($lock, $chroot) = @_;
  
  foreach my $depend ($lock->port->all_depends) {
    if ($depend->status eq 'pass' || $depend->status eq 'warn') {
      # There should be a package that we can use to install the port.
      copy_pkgfile($depend, $chroot);
      next;
    }
    
    die "Port was scheduled as ready to build, but $depend had not been built successfuly.\n";
  }
  
  return 1;
}
    

=head2 copy_pkgfile($port, $chroot)

Copy a single package file from the master dir to the chroot package dir.

=cut
      
sub copy_pkgfile {
  my ($port, $chroot) = @_;
  
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $run  = $port->run->id;
  my $dest = join('/', $chroot->root, $chroot->packages, 'All');
  
  my $cmd = "/usr/bin/scp $Magus::Config{'PkgfilesRoot'}/$run/$file $dest";
  report('debug', "downloading: $run/$file");
  
  my $out = `$cmd 2>&1`;
  
  if ($? != 0) {
    die "$cmd returned non-zero: $out\n";
  }
}  
  

=head2 upload_pkgfile($port, $chroot)  
  
Upload the built package of the current port to the master dir.

=cut

sub upload_pkgfile {
  my ($port, $chroot) = @_;

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
  my $run  = $port->run->id;
          
  my $cmd = "/usr/bin/scp $from $Magus::Config{'PkgfilesRoot'}/$run/$file";
  report('debug', "uploading: $run/$file");
  
  my $out = `$cmd 2>&1`;

  if ($? != 0) {
    die "$cmd returned non-zero: $out\n";
  }
}  


=head2 insert_results($port, $results)

Takes a port and a the data structure from Magus::PortTester, and then
inserts the results into the database, referencing the current port.

=cut  



sub insert_results {
  my ($port, $results) = @_;

  report('info', "Inserting results for $port; summary: $results->{summary}");
  
  $port->status($results->{'summary'});
  $port->update;  
  
  my %type_conversion = (skip => 'skip', warning => 'warn', error => 'fail');
  
  foreach my $type (qw(skip warning error)) {
    next unless $results->{$type . 's'};
    
    foreach my $sr (@{$results->{$type . 's'}}) {
      $port->note_event($type_conversion{$type} => $sr->{msg});
    }
  }  
  
  if ($results->{log}) {
    Magus::Log->insert({ port => $port, data => $results->{log}->{data}});
  }
}

=head2 daemonize()

Disassociate with our parent process group and run as a daemon.

=cut

sub daemonize {
  report('debug', 'daemonizing');
  
  my $pid = fork;
  
  if (!defined $pid) {
    die "Unable to fork self: $!\n";
  }
  
  # if $pid is non-zero, we're the parent.  Time to die.
  exit 0 if $pid;
  
  # create our own process group
  setsid();
}

=head2 report($level, $format, ...)

Logs the current      

=cut

{
  my $is_open = 0;

  sub report {
    my ($level, @msg) = @_;
    
    openlog("magus", "ndelay,pid", "local0") unless $is_open++;
    
    syslog($level, @msg);

    if ($opts{v}) {
      my ($format, @args) = @msg;
      my $time = localtime;
      
      printf "[$time] ($$): $format\n", @args;
    }    
  }
}


=head2 handle_exception($error, $lock)

Report an exception for the given lock.

=cut

sub handle_exception {
  my ($error, $lock) = @_;

  die $error if $error =~ m/DBI/;
  
  if ($error =~ m/SIGINT/) {
    $lock->port->reset;
    
    report('debug', 'Exiting 0 from SIGINT (prior result for %s deleted).', $lock->port);
    exit 0;
  }
      
  report('err', "Exception throw building %s: %s", $lock->port, $error);
  
  $lock->port->set_result_internal(internal => ExceptionThrown => "Internal exception thrown: $error");
}


=head3 get_current_run()

Check to see if the current run is the latest, and update it if it isn't.

=cut

sub get_current_run {
  my $current = Magus::Run->latest($Magus::Machine) || return;
  my $tree_id = get_tree_id("$Magus::Config{'SlaveDataDir'}/mports") || 0;

  if ($current != $Magus::Machine->run || $tree_id != $current) {
    $Magus::Machine->run($current);
    $Magus::Machine->update;
    
    my $tarball = $current->tarballpath;
    
    report(debug => "Downloading tree ID $current: $tarball");
 
    my $dir = $Magus::Config{'SlaveDataDir'} || die "SlaveDataDir is not set!\n";
    
    mkdir($dir);
    chdir($dir) || die "Couldn't chdir to $dir: $!\n";
        
    if (system("/usr/bin/fetch -p $tarball") != 0) {
      die "Couldn't fetch $tarball";
    }

    report(debug => "Deleting old $dir/mports");
    rmtree('$dir/mports');
    
    report(debug => "Extracting %s", $current->tarball);
    system('/usr/bin/tar xf ' . $current->tarball);

    unlink($current->tarball);
        
    report(debug => "Reloading self.");
    exec($self, @origARGV);
  }
  
  return $current;
}


sub get_tree_id {
  my ($root) = @_;
  my $file = "$root/.magus_run_id";

  open(ID, '<', $file) || return;
  chomp(my $id = <ID>);
  close(ID) || die "Couldn't close $file: $!\n";
  
  return $id;
}

1;
__END__
