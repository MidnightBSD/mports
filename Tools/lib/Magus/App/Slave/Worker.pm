package Magus::App::Slave::Worker;

use strict;
use warnings;

use File::Basename qw(dirname);
use File::Path qw(mkpath);
use IO::Select;
use IPC::Open3 qw(open3);
use Symbol qw(gensym);
use Text::ParseWords qw(shellwords);
use Mport::Globals qw($MAKE);
use Magus::Run ();

sub run {
  my ($class, %args) = @_;
  
  local $SIG{CHLD} = 'DEFAULT';
  local $SIG{TERM} = sub { die "SIGTERM\n" };
  local $SIG{INT}  = sub { die "SIGINT\n" };
  
  my $self = bless \%args, $class;
  
  eval {
    $self->{port} = $self->{lock}->port;
    $self->{phase} = $self->{lock}->phase || 'build';
    $self->log->info("Starting $self->{phase} phase for $self->{port}");
    $self->{port}->set_phase_status($self->{phase}, 'running');
    $self->{port}->note_event(info => ucfirst($self->{phase}) . " Started", $self->{phase}, 'PhaseStarted');
    $self->run_phase();
    $self->{port}->refresh;
    $self->{port}->note_event($self->{port}->phase_status($self->{phase}) => ucfirst($self->{phase}) . " complete.", $self->{phase}, 'PhaseComplete');
  }; 
  
  if ($@) {
	if ($@ =~ m/DBI/) {
	  # we want to let the parent know that we lost the DB connection.
	  exit 6;
	} elsif ($@ =~ m/SIGINT/ || $@ =~ /SIGTERM/) {
	  return;
	} 
	
	# we make sure we never have an uncaught exception!
	my $error = $@;
	eval { 
	  my $port = $self->port;
	  my $phase = $self->{phase} || 'build';
	  $self->log->err("Exception thrown during $phase phase for $port: $error");
	  if ($phase eq 'build') {
	    $port->set_result_internal("Exception thrown: $error");
	  } else {
	    $port->set_phase_status($phase, 'internal');
	    $port->note_event(internal => "Exception thrown: $error", $phase, 'Exception');
	  }
        };
        
        if ($@ && $@ =~ m/DBI/) {
          $self->log->err($@);
          exit 6;
        }
  }
}

sub run_phase {
  my ($self) = @_;

  my $phase = $self->{phase};

  if ($phase eq 'scan') {
    $self->run_scan_phase();
    return;
  }

  $self->prep_chroot();

  if ($phase eq 'build') {
    $self->inject_depends();
    $self->inject_distfiles();
    $self->run_make_phase('build');
    $self->{port}->refresh;
    if ($self->{port}->status eq 'pass' || $self->{port}->status eq 'warn') {
      $self->upload_pkgfile();
      $self->upload_distfiles();
    }
    return;
  }

  if ($phase eq 'fetch') {
    $self->inject_distfiles();
    $self->run_make_phase('fetch');
    $self->{port}->refresh;
    if ($self->{port}->phase_status('fetch') eq 'pass' || $self->{port}->phase_status('fetch') eq 'warn') {
      $self->upload_distfiles();
    }
    return;
  }

  if ($phase eq 'test') {
    $self->inject_depends();
    $self->inject_pkgfile($self->{port});
    $self->inject_distfiles();
    $self->run_make_phase('test');
    return;
  }

  die "Unknown Magus phase: $phase\n";
}

sub prep_chroot {
  my ($self) = @_;
 
  $self->log->debug("Preparing chroot $self->{worker_id}");
  
  $self->{chroot} = Magus::Chroot->new(
    workerid => $self->{worker_id},
    tarball  => $Magus::Config{ChrootTarBall},
  );
}


sub inject_depends {
  my ($self) = @_;
  
  foreach my $depend ($self->{port}->all_depends) {
    if ($depend->status eq 'pass' || $depend->status eq 'warn') {
      # There should be a package that we can use to install the port.
      $self->inject_pkgfile($depend);
      next;
    }
  
    die "Port was scheduled as ready to build, but $depend had not been built successfuly.\n";
  }
}

sub inject_pkgfile {
  my ($self, $port) = @_;
  
  my $chroot = $self->{chroot};
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $run  = $port->run->id;
  my $dest = join('/', $chroot->root, $chroot->packages, 'All');
  
  my $src = "$Magus::Config{'PkgfilesRoot'}/$run/$file";
  
  $self->log->debug("downloading: $run/$file");
  
  my ($exit, $out) = $self->run_command('/usr/bin/scp', $src, $dest);
  
  if ($exit != 0) {
    die "scp returned non-zero: $out\n";
  }
}

sub inject_distfiles {
  my ($self) = @_;

  my $port = $self->{port};
  my $chroot = $self->{chroot};
  my $run  = $port->run->id;

  foreach my $distfile ($port->distfiles) {
    my $file = $self->distfile_cache_path($distfile->filename) or next;
    my $dest = join('/', $chroot->root, $chroot->distfiles, $file);
    if (-e $dest) {
      $self->log->debug("download skipped, already present: $run/$file");
      next;
    }
    $self->ensure_parent_dir($dest);

    my $src = "$Magus::Config{'DistfilesRoot'}/$run/$file";

    $self->log->debug("downloading: $run/$file");

    my ($exit, $out) = $self->run_command('/usr/bin/scp', $src, $dest);

    if ($exit != 0) {
      $self->log->debug("download failed: $run/$file $out");
      $self->inject_previous_run_distfile($file, $dest);
    }
  }
}

sub inject_previous_run_distfile {
  my ($self, $file, $dest) = @_;

  my $previous_run = $self->previous_run or return;
  my $run = $previous_run->id;
  my $src = "$Magus::Config{'DistfilesRoot'}/$run/$file";

  $self->log->debug("downloading from previous run: $run/$file");

  my ($exit, $out) = $self->run_command('/usr/bin/scp', $src, $dest);

  if ($exit != 0) {
    $self->log->debug("previous run download failed: $run/$file $out");
  } else {
    $self->log->debug("downloaded from previous run: $run/$file");
  }
}

sub previous_run {
  my ($self) = @_;

  return $self->{previous_run} if exists $self->{previous_run};

  my $run = $self->{port}->run;
  my $run_id = Magus::Run->db_Main->selectrow_array(
    q{
      SELECT id
        FROM runs
       WHERE arch = ?
         AND osversion = ?
         AND id < ?
       ORDER BY id DESC
       LIMIT 1
    },
    undef,
    $run->arch,
    $run->osversion,
    $run->id,
  );

  return $self->{previous_run} = $run_id ? Magus::Run->retrieve($run_id) : undef;
}


sub run_make_phase {
  my ($self, $phase) = @_;
  
  my $port = $self->{port};
  my $chroot = $self->{chroot};

  # we fork so just the child chroots, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish, and if we get sigint
    # while we are waiting, we stop the child and then cleanup
    local $SIG{INT} = sub { 
      waitpid($pid, 0);
      $self->{port}->reset;
      exit(0);
    };
    
    waitpid($pid, 0);
  } elsif (defined $pid) {
    # child here; chroot and test the port
    eval {
      $chroot->do_chroot();
      chdir($port->origin);
    
      my $test = Magus::PortTest->new(port => $port, chroot => $chroot);

      $self->log->info("Running $phase phase for $port");

      my $results = $test->run($phase);
  
      $self->insert_results($phase, $results);
    };
    
    if ($@) {
      if ($@ =~ m/SIGINT/ || $@ =~ m/DBI/) {
        exit(0);
      }
      # make sure we get to that exit() down there. 
      my $error = $@;
      $self->log->err("Exception thrown during $phase phase for $port: $error");
      eval {
        if ($phase eq 'build') {
          $port->set_result_internal("Exception thrown: $error");
        } else {
          $port->set_phase_status($phase, 'internal');
          $port->note_event(internal => "Exception thrown: $error", $phase, 'Exception');
        }
      };
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
  } else {
    die "Child exited unexpectedly: $?\n";
  }
}  

sub insert_results {
  my ($self, $phase, $results) = @_;
  
  $self->log->info("Inserting $phase results for %s; summary: $results->{summary}", $self->port);

  if ($phase eq 'build') {
    $self->port->status($results->{'summary'});
    $self->port->update;
  }

  $self->port->set_phase_status($phase, $results->{'summary'});
            
  my %type_conversion = (skip => 'skip', warning => 'warn', error => 'fail');
                
  foreach my $type (qw(skip warning error)) {
    next unless $results->{$type . 's'};
                          
    foreach my $sr (@{$results->{$type . 's'}}) {
      $self->port->note_event($type_conversion{$type} => $sr->{msg}, $phase, $sr->{name});
    }
  }  
                                            
  if ($results->{log}) {
    $self->replace_phase_log($phase, $results->{log}->{data});
    if ($phase eq 'build') {
      Magus::Log->search(port => $self->port)->delete_all;
      Magus::Log->insert({ port => $self->port, data => $results->{log}->{data}});
    }
  }
}

sub run_scan_phase {
  my ($self) = @_;

  my $port = $self->{port};
  my $run = $port->run->id;
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $pkgfile = "$Magus::Config{'PkgfilesRoot'}/$run/$file";

  if (!-f $pkgfile) {
    my $msg = "Package file is missing: $pkgfile";
    $port->set_phase_status(scan => 'internal');
    $port->note_event(internal => $msg, scan => 'PackageMissing');
    $self->replace_phase_log(scan => $msg);
    return;
  }

  my $scanner = $Magus::Config{ClamAVScanner} || 'clamscan';
  my @options = $self->scanner_options;
  my ($exit, $out) = $self->run_command($scanner, @options, $pkgfile);

  $self->replace_phase_log(scan => $out);

  if ($exit == 0) {
    $port->set_phase_status(scan => 'pass');
    $port->note_event(info => "Virus scan passed.", scan => 'VirusScanClean');
  } elsif ($exit == 1) {
    $port->set_phase_status(scan => 'fail');
    $port->note_event(fail => "Virus scan found a problem.", scan => 'VirusScanFailed');
  } else {
    $port->set_phase_status(scan => 'internal');
    $port->note_event(internal => "Virus scanner exited with $exit.", scan => 'VirusScanError');
  }
}
    
sub upload_pkgfile {
  my ($self) = @_;
  my ($port, $chroot) = ($self->{port}, $self->{chroot});
  my $run  = $port->run->id;

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
  
  my $dest = "$Magus::Config{'PkgfilesRoot'}/$run/$file";

  $self->log->debug("uploading: $run/$file");
  
  my ($exit, $out) = $self->run_command('/usr/bin/scp', $from, $dest);

  if ($exit != 0 ) {
     die "scp returned non-zero: $out\n";
  }
}

sub upload_distfiles {
  my ($self) = @_;
  my ($port, $chroot) = ($self->{port}, $self->{chroot});
  my $run  = $port->run->id;

  foreach my $distfile ($port->distfiles) {
    my $file = $self->distfile_cache_path($distfile->filename) or next;
    my $from = join('/', $chroot->root, $chroot->distfiles, $file);
    my $dest = "$Magus::Config{'DistfilesRoot'}/$run/$file";
    if (-e $dest) {
      $self->log->debug("upload skipped, already present: $run/$file");
      next;
    }
    $self->ensure_parent_dir($dest);

    $self->log->debug("uploading: $run/$file");

    my ($exit, $out) = $self->run_command('/usr/bin/scp', $from, $dest);

    if ($exit != 0 ) {
      $self->log->debug("upload failed: $run/$file $out");
    }
  }
}

sub ensure_parent_dir {
  my ($self, $path) = @_;

  my $dir = dirname($path);
  mkpath($dir) unless -d $dir;
  die "Couldn't create $dir: $!\n" unless -d $dir;
}

sub replace_phase_log {
  my ($self, $phase, $data) = @_;

  Magus::PhaseLog->search(port => $self->port, phase => $phase)->delete_all;
  Magus::PhaseLog->insert({ port => $self->port, phase => $phase, data => $data });
}

sub distfile_cache_path {
  my ($self, $file) = @_;

  return unless defined $file;

  $file =~ s/:[A-Za-z0-9_,]+$//;
  $file =~ s/\?.*$//;

  if ($file =~ m{(?:^|/)\.\.(?:/|$)} || $file =~ m{^/}) {
    $self->log->err("Unsafe distfile path ignored: $file");
    return;
  }

  my $subdir = $self->distfile_subdir;
  return join('/', $subdir, $file) if length $subdir && $file !~ m{^\Q$subdir\E/};
  return $file;
}

sub distfile_subdir {
  my ($self) = @_;

  return $self->{distfile_subdir} if defined $self->{distfile_subdir};

  my @cmd = ($MAKE, '-C', $self->{port}->origin, '-V', 'DIST_SUBDIR');
  my $flavor = $self->{port}->flavor;
  push @cmd, "FLAVOR=$flavor" if defined $flavor && length $flavor;

  my ($exit, $out) = $self->run_command(@cmd);
  chomp($out);

  if ($exit != 0) {
    $self->log->debug("Unable to determine DIST_SUBDIR for $self->{port}: $out");
    return $self->{distfile_subdir} = '';
  }

  if ($out =~ /[[:cntrl:]]/) {
    $self->log->err("Unsafe DIST_SUBDIR ignored for $self->{port}: $out");
    return $self->{distfile_subdir} = '';
  }

  if ($out =~ m{(?:^|/)\.\.(?:/|$)} || $out =~ m{^/}) {
    $self->log->err("Unsafe DIST_SUBDIR ignored for $self->{port}: $out");
    return $self->{distfile_subdir} = '';
  }

  return $self->{distfile_subdir} = $out;
}

sub scanner_options {
  my ($self) = @_;

  my $options = $Magus::Config{ClamAVOptions};
  return unless defined $options && length $options;

  my @args = ref($options) eq 'ARRAY' ? @$options : shellwords($options);
  foreach my $arg (@args) {
    die "Invalid ClamAV option contains a control character.\n"
      if !defined($arg) || $arg =~ /[[:cntrl:]]/;
  }

  return @args;
}

sub run_command {
  my ($self, @cmd) = @_;

  foreach my $arg (@cmd) {
    die "Invalid command argument contains a control character.\n"
      if !defined($arg) || $arg =~ /[[:cntrl:]]/;
  }

  my $err = gensym;
  my $pid = open3(undef, my $out_fh, $err, @cmd);
  my $selector = IO::Select->new($out_fh, $err);
  my $out = '';

  while (my @ready = $selector->can_read) {
    foreach my $fh (@ready) {
      my $buf = '';
      my $read = sysread($fh, $buf, 8192);
      if ($read) {
        $out .= $buf;
      } else {
        $selector->remove($fh);
        close($fh);
      }
    }
  }

  waitpid($pid, 0);

  return ($? >> 8, $out);
}

sub log {
  return $_[0]->{logger};
}    

sub port {
  return $_[0]->{port};
}
                                   

1;
__END__
