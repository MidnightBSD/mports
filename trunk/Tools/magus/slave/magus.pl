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
# $MidnightBSD: mports/Tools/magus/slave/magus.pl,v 1.25 2008/09/22 18:28:08 ctriv Exp $
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

use Sys::Syslog;
use POSIX qw(setsid :sys_wait_h);
use Getopt::Std qw(getopts);
use File::Path qw(rmtree);

# Load some things before we chroot.
use YAML::Dumper;


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
our $LastExit;

$SIG{CHLD} = sub {
  my $pid;

  while (($pid = waitpid(-1, WNOHANG)) > 0) {
    # we don't care about children that aren't magus.pls (make and what not also go thru this).
    my $info = delete $Children{$pid} || return;
    
    $Children--;
    $WorkerIDs{$info->{worker_id}} = 1;
    push(@DeadChildren, {lock => $info->{lock}, pid => $pid});
  }
};

$SIG{INT} = sub { warn "Parent caught SIGINT"; kill_children(); exit 0 };


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

report('info', "Starting magus on %s (%s)", $Magus::Machine->name, $Magus::Machine->arch);

clean_up_reports_dir();

daemonize() unless $opts{f};

while (1) {
  eval { main() };

  if ($@) {
    local $_ = $@;
    
    # Check ping in case a dropped DB caused some other exception.
    if ((m/lost\s+connection/i || m/can't\s+connect/i || m/server\s+shutdown/i || m/gone\s+away/i) || !Magus::DBI->ping) {
      while (1) {
        report(err => "Could not connect to database ($@) waiting $Magus::Config{'LostDBWaitPeriod'} seconds");
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
  # This isn't right yet. XXX
  
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
        report(debug => "No ports to build, sleeping $Magus::Config{DoneWaitPeriod} seconds.");
        sleep($Magus::Config{DoneWaitPeriod});
        next MAIN;
      }

     
      eval { start_child($lock); };
      if ($@) {
        report(debug => "Unhandled child exception: $@\n");
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
    report(info => "Forked child worker $pid");
  
    # parent return
    $Children{$pid} = { lock => $lock, worker_id => $worker_id };
    $Children++;
        
    X();
    return;
  } elsif (defined($pid)) {
    $SIG{INT}  = sub { die "CAUGHT SIGINT\n"; };
    $SIG{CHLD} = 'DEFAULT';
    
    eval { init_results_file(); };
    
    if ($@) {
      # not good.
      report(alert => "Unable to init reporting system for child! $@");
      exit(72);
    }

    eval { run_test($lock, $worker_id); };

    handle_exception($@, $lock) if $@;
    
    exit(0);
  } else {
    die "Couldn't fork: $!\n";
  }
}

=head2 run_test($lock)

Run the entire test process on the given port (well, the given lock, but the
port is at C<< $lock->port >>).  

=cut

sub run_test {
  my ($lock, $worker_id) = @_;

  my $port = $lock->port;
  $port->note_event(info => "Test started.");
 
  my $chroot = Magus::Chroot->new(
    workerid => $worker_id,
    tarball  => $Magus::Config{ChrootTarBall},
  );

  copy_dep_pkgfiles($lock, $chroot);

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);

  
  $chroot->do_chroot();
  chdir($port->origin);
    
  my $test = Magus::PortTest->new(port => $port, chroot => $chroot);
  report('info', "Building $port");
  my $results = $test->run;
  
  $results->{pkgfile} = $from;
    
  store_results($results);
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
  

=head2 upload_pkgfile($port, $file)  
  
Upload the built package of the current port to the master dir.

=cut

sub upload_pkgfile {
  my ($port, $from) = @_;

  my $run  = $port->run->id;
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
          
  my $cmd = "/usr/bin/scp $from $Magus::Config{'PkgfilesRoot'}/$run/$file";
  report('debug', "uploading: $run/$file");
  
  my $out = `$cmd 2>&1`;

 # if ($LastExit != 0 ) {
 #   die "$cmd returned non-zero: $out\n";
 # }
  
  # we should really check the error message, but we won't handle the logging of the exception correctly anyways..
  # so for now, we just assume things go right.  I will need to look at this again.

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
  
  if ($port->status eq 'pass' || $port->status eq 'warn') {
    upload_pkgfile($port, $results->{pkgfile});
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
  
  return if $error =~ m/SIGINT/;
      
  report('err', "Exception thrown building %s: %s", $lock->port, $error);
  
  store_results({ exception => $error });
}



=head2 init_results_file()

Prepares the results file for writing.  Run this before you chroot.

=cut

{
  my $fh; # this var is private to init_results_file() and store_results()
  sub init_results_file {
    my $file = "$Magus::Config{SlaveResultsDir}/$$";
  
    if (! -d $Magus::Config{SlaveResultsDir} && !mkdir($Magus::Config{SlaveResultsDir})) {
      die "Couldn't mkdir $Magus::Config{SlaveResultsDir}: $!";
    }
    
    open($fh, '>', $file) || die "Couldn't open $file: $!";
    
    return;
  }
    

=head3 store_results($ref)

Dump the hashref into a file that the parent can find.

=cut

  sub store_results {
    my ($ref) = @_;
  
    my $yaml = YAML::Dump($ref);
    
  
    print $fh $yaml;
    close($fh);
    undef $fh;
  }
}


=head3 process_dead_children(@remains)

Takes a list of hash containing information about dead child 
processes and takes action on that information.

=cut

sub process_dead_children {
  while (@DeadChildren) {
    my $corpse = shift @DeadChildren;
      
    my $port = $corpse->{lock}->port;
    my $file = "$Magus::Config{SlaveResultsDir}/$corpse->{pid}";
    
    my $results;
    
    # if there's no file, then there are no results to store, the child
    # probably exited from SIGINT, or maybe a dropped DB.
    if (-e $file) {
      eval {
        $results = YAML::LoadFile($file)
      };
      
      # unlink($file) || report(err => "Couldn't unlink $file: $!);
      
      if ($@) {
        report(err => "Unable to load YAML results file (pid: $corpse->{pid}): $@");
        $port->note_event(internal => "Unable to load YAML results file: $@");
        $port->status('internal');
        $port->update;      
      } elsif ($results->{exception}) {
        report(err => "Exception from pid $corpse->{pid}: $results->{exception}");
        $port->note_event(internal => $results->{exception});
        $port->status('internal');
        $port->update;
      } else {
        insert_results($port, $results);
      }
    }
    
    $corpse->{lock}->delete;
  }
}      
    



=head3 get_current_run()

Check to see if the current run is the latest, and update it if it isn't.

=cut

sub get_current_run {
  my $current = Magus::Run->latest($Magus::Machine) || return;
  my $tree_id = get_tree_id("$Magus::Config{'SlaveDataDir'}/mports") || 0;

  #report(debug => "latest run: $current, tree id: $tree_id, machine id: " . $Magus::Machine->run);
  
  if ($current != $Magus::Machine->run || $tree_id != $current) {
    local $SIG{CHLD} = 'DEFAULT';
  
    if ($Children) {
      report(debug => "Children active, not moving to new run yet.");
      return;
    }
  
    $Magus::Machine->run($current);
    $Magus::Machine->update;
    
    my $tarball = $current->tarballpath;
    
    report(debug => "Downloading tree ID $current: $tarball");
 
    my $dir = $Magus::Config{'SlaveDataDir'} || die "SlaveDataDir is not set!\n";
    
    mkdir($dir);
    chdir($dir) || die "Couldn't chdir to $dir: $!\n";
        
    if (system("/usr/bin/fetch -p $tarball") != 0) {
      die "Couldn't fetch $tarball: (exit $?)";
    }

    report(debug => "Deleting old $dir/mports");
    rmtree("$dir/mports");
    
    report(debug => "Extracting %s", $current->tarball);
    system('/usr/bin/tar xf ' . $current->tarball);

    unlink($current->tarball);
        
    report(debug => "Reloading self.");
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
    local $SIG{CHLD} = 'DEFAULT';

    warn "Killing children @{[keys %Children ]}\n";
    X();
    kill INT => keys %Children;
    
    # make sure that we wait until all the kids are dead.
    my $kid;
    do {
      $kid = waitpid(-1, WNOHANG);
    } until $kid > 0;
  }
    
  foreach my $lock (Magus::Lock->search(machine => $Magus::Machine)) {
    $lock->port->reset;
    $lock->delete;
  }
}

    
=head2 clean_up_reports_dir()

Nuke everything in the reports dir.

=cut

sub clean_up_reports_dir {
  local $SIG{CHLD} = 'DEFAULT';
  system("rm $Magus::Config{SlaveResultsDir}/*");
}
      

1;
__END__
