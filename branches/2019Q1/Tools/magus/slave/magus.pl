#!/usr/bin/perl
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
# $MidnightBSD: mports/Tools/magus/slave/magus.pl,v 1.34 2009/04/14 23:49:25 laffer1 Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#

#
# todo:	setproctitle
#	

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib"; 

use Magus;
use Magus::App::Logger;
use Magus::App::Slave::Worker;

use Sys::Syslog;
use POSIX qw(setsid :sys_wait_h);
use Getopt::Std qw(getopts);
use File::Path qw(rmtree mkpath);



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

=item -j <n>

Test n ports in parallel.  Defaults to 1.

=cut


our @origARGV = @ARGV;
our $Self     = "$Magus::Config{SlaveMportsDir}/Tools/magus/slave/magus.pl";

our %Children;
our $Children = 0;
our @DeadChildren;
our %WorkerIDs;
our $Logger;

$SIG{CHLD} = sub {
  my $pid;

  while (($pid = waitpid(-1, WNOHANG)) > 0) {
    # we don't care about children that aren't magus.pls (make and what not also go thru this).
    my $info = delete $Children{$pid} || return;
    push(@DeadChildren, { lock => $info->{lock}, exitcode => $? >> 8, pid => $pid });
    $Children--;
    $WorkerIDs{$info->{worker_id}} = 1;
  }
};

$SIG{TERM} = $SIG{INT} = sub { kill_children(); exit 0 };


=pod debug 

sub X {
  use Data::Dumper;
  
  print Dumper({PID => $$, ChildrenCnt => $Children, Children => \%Children, Dead => \@DeadChildren, IDs => \%WorkerIDs});
}

=cut

sub X { }
    
our (%opts, $run);
getopts('fvj:', \%opts);
  
$opts{j} ||= 1;
%WorkerIDs = map { $_ => 1 } 1 .. $opts{j};

$Logger = Magus::App::Logger->new(verbose => $opts{v});

daemonize() unless $opts{f};

# create our own process group
setsid();

create_pid_file();

$Logger->info("Initializing chroot subsystem.");

init_chroot();

$Logger->info("Starting magus on %s (%s)", $Magus::Machine->name, $Magus::Machine->arch);

while (1) {
  eval { main() };

  if ($@) {
    local $_ = $@;
    
    # Check ping in case a dropped DB caused some other exception.
    if ((m/lost\s+connection/i || m/can't\s+connect/i || m/server\s+shutdown/i || m/gone\s+away/i) || !Magus::DBI->ping) {
      while (1) {
        $Logger->err("Could not connect to database ($@) waiting $Magus::Config{'LostDBWaitPeriod'} seconds");
        sleep($Magus::Config{'LostDBWaitPeriod'});
        if (Magus::DBI->ping) {
          last;
        }
      }

      # back up to the main() call we go.
    } else {
      die $_;
    }
  }
}



sub main {
  my $parentPID = $$;

  
  MAIN: while (1) {
    if (@DeadChildren) {
      process_dead_children();
    }

    while ($Children < $opts{j}) {    
      X();
      my $lock;
      my $run = get_current_run();
      if (!$run || !($lock = Magus::Lock->get_ready_lock($run))) {
        # there's no more ports to test, sleep for a while and check again.
        X();
        $Logger->debug("No ports to build, sleeping $Magus::Config{DoneWaitPeriod} seconds.");
        sleep($Magus::Config{DoneWaitPeriod});
        next MAIN;
      }

     
      eval { start_child($lock); };
      if ($@) {
        $Logger->debug("Unhandled child exception: $@\n");
        exit(0) if $$ != $parentPID;
      }
    }
      
    sleep;
  }
}
  


=head2 start_child($lock)

Start the child off.

=cut

sub start_child {
  my ($lock) = @_;
  
  my $worker_id = (keys %WorkerIDs)[0] || die "No worker IDs\n";
  delete $WorkerIDs{$worker_id};
  
  # XXX Block signals
  my $pid = fork;
  
  if ($pid) {
    $Logger->info("Forked child worker $pid");
  
    # parent return
    $Children{$pid} = { lock => $lock, worker_id => $worker_id };
    $Children++;
        
    X();
    return;
  } elsif (defined($pid)) {
    $0 = "Magus - worker $worker_id";
    Magus::App::Slave::Worker->run(
      lock 	=> $lock, 
      worker_id => $worker_id,
      logger    => $Logger,
    ); 
    exit(0);
  } else {
    die "Couldn't fork: $!\n";
  }
}


=head2 daemonize()

Disassociate with our parent process group and run as a daemon.

=cut

sub daemonize {
  $Logger->debug('daemonizing');
  
  my $pid = fork;
  
  if (!defined $pid) {
    die "Unable to fork self: $!\n";
  }
  
  # if $pid is non-zero, we're the parent.  Time to die.
  exit 0 if $pid;
}


=head3 process_dead_children(@remains)

Takes a list of hash containing information about dead child 
processes and takes action on that information.

=cut

sub process_dead_children {
  while (@DeadChildren) {
    my $corpse = $DeadChildren[0];

    if ($corpse->{exitcode} == 6) {
      $Logger->info("Child $corpse->{pid} lost database connection.  Reseting %s", $corpse->{lock}->port);
      $corpse->{lock}->port->reset;
    } 
    
    $corpse->{lock}->delete;
    
    # we do this last, so if a DBI exception was thrown while clearing the lock, we try again later.
    shift @DeadChildren;
  }
}      
    



=head3 get_current_run()

Check to see if the current run is the latest, and update it if it isn't.

=cut

sub get_current_run {
  my $current = Magus::Run->latest($Magus::Machine) || return;
  my $tree_id = get_tree_id("$Magus::Config{'SlaveDataDir'}/mports") || 0;

  if ($current != $Magus::Machine->run || $tree_id != $current) {
    local $SIG{CHLD} = 'DEFAULT';
  
    if ($Children) {
      $Logger->debug("Children active, not moving to new run yet.");
      return;
    }
  
    $Magus::Machine->run($current);
    $Magus::Machine->update;
    
    my $tarball = $current->tarballpath;
    
    $Logger->debug("Downloading tree ID $current: $tarball");
 
    my $dir = $Magus::Config{'SlaveDataDir'} || die "SlaveDataDir is not set!\n";
    
    mkdir($dir);
    chdir($dir) || die "Couldn't chdir to $dir: $!\n";
        
    if (system("/usr/bin/fetch -p $tarball") != 0) {
      die "Couldn't fetch $tarball: (exit $?)";
    }

    $Logger->debug("Deleting old $dir/mports");
    rmtree("$dir/mports");
    
    $Logger->debug("Extracting %s", $current->tarball);
    system('/usr/bin/tar xf ' . $current->tarball);

    unlink($current->tarball);
        
    $Logger->debug("Reloading self.");
    exec($Self, @origARGV);
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


=head2 kill_children()

Kill all the children we have.

=cut

sub kill_children {
  if ($Children) {
    local $SIG{INT}  = 'IGNORE';
    local $SIG{TERM} = 'IGNORE';
    local $SIG{CHLD} = 'DEFAULT';
    
    $Logger->debug("Killing children (Active Child Count: $Children)");
    X();
    
    # send sigint to our entire process group    
    kill INT => -$$;
    
    # make sure that we wait until all the kids are dead.
    my $kid;
    do {
      $kid = waitpid(-1, WNOHANG);
    } until $kid > 0;
  }
    
  foreach my $lock (Magus::Lock->search(machine => $Magus::Machine)) {
    $Logger->debug("Reseting %s", $lock->port);
    $lock->port->reset;
    $lock->delete;
  }
}


=head2 create_pid_file()

Create a pid file at SlavePidFile

=cut

sub create_pid_file {
  my $fh;
  my $file = $Magus::Config{SlavePidFile};
  
  open($fh, '>', $file) || die "Couldn't open $file: $!\n";
  print $fh "$$\n";
  close($fh) || die "Couldn't close $file: $!\n";
}


=head2 init_chroot()

Get the reference dir for the chroot set up so the children don't get 
into a race trying to do it.

=cut

sub init_chroot {
  local $SIG{CHLD} = 'DEFAULT';
  
  unless (-d $Magus::Config{SlaveMportsDir}) {
    mkpath($Magus::Config{SlaveMportsDir});
  }
  
  Magus::Chroot->new(
    workerid => 1,
    tarball  => $Magus::Config{ChrootTarBall},
  );
}

  
    
1;
__END__
