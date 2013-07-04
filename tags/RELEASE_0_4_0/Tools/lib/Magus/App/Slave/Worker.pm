package Magus::App::Slave::Worker;

use strict;
use warnings;

sub run {
  my ($class, %args) = @_;
  
  local $SIG{CHLD} = 'DEFAULT';
  local $SIG{TERM} = sub { die "SIGTERM\n" };
  local $SIG{INT}  = sub { die "SIGINT\n" };
  
  my $self = bless \%args, $class;
  
  eval {
        $self->{port} = $self->{lock}->port;
        $self->log->info("Starting test run for $self->{port}");
	$self->{port}->note_event(info => "Test Started");
	$self->prep_chroot();
	$self->inject_depends();
  	$self->run_test();
  	$self->{port}->note_event($self->{port}->status => "Test complete.");
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
	  $self->log->err("Exception thrown building $port: $error");
	  $port->set_result_internal("Exception thrown: $error");
        };
        
        if ($@ && $@ =~ m/DBI/) {
          $self->log->err($@);
          exit 6;
        }
  }
}

sub prep_chroot {
  my ($self) = @_;
 
  $self->log->debug("Preping chroot $self->{worker_id}");
  
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
  
  my $cmd = "/usr/bin/scp $Magus::Config{'PkgfilesRoot'}/$run/$file $dest";
  
  $self->log->debug("downloading: $run/$file");
  
  my $out = `$cmd 2>&1`;
  
  if ($? != 0) {
    die "$cmd returned non-zero: $out\n";
  }
}  
                                                                                
                                                             
sub run_test {
  my ($self) = @_;
  
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

      $self->log->info("Building $port");

      my $results = $test->run;
  
      $self->insert_results($results);
    };
    
    if ($@) {
      if ($@ =~ m/SIGINT/ || $@ =~ m/DBI/) {
        exit(0);
      }
      # make sure we get to that exit() down there. 
      my $error = $@;
      $self->log->err("Exception thrown building $port: $error");
      eval { $port->set_result_internal("Exception thrown: $error"); };
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
    
    
    if ($port->status eq 'pass' || $port->status eq 'warn') {
        $self->upload_pkgfile();
    }
  } else {
    die "Child exited unexpectantly: $?\n";
  }
}  

sub insert_results {
  my ($self, $results) = @_;
  
  $self->log->info("Inserting results for %s; summary: $results->{summary}", $self->port);
      
  $self->port->status($results->{'summary'});
  $self->port->update;  
            
  my %type_conversion = (skip => 'skip', warning => 'warn', error => 'fail');
                
  foreach my $type (qw(skip warning error)) {
    next unless $results->{$type . 's'};
                          
    foreach my $sr (@{$results->{$type . 's'}}) {
      $self->port->note_event($type_conversion{$type} => $sr->{msg});
    }
  }  
                                            
  if ($results->{log}) {
    Magus::Log->insert({ port => $self->port, data => $results->{log}->{data}});
  }
}
    
sub upload_pkgfile {
  my ($self) = @_;
  my ($port, $chroot) = ($self->{port}, $self->{chroot});
  my $run  = $port->run->id;

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
  
  my $cmd = "/usr/bin/scp $from $Magus::Config{'PkgfilesRoot'}/$run/$file";

  $self->log->debug("uploading: $run/$file");
  
  my $out = `$cmd 2>&1`;

  if ($? != 0 ) {
     die "$cmd returned non-zero: $out\n";
  }
} 
    
    
sub log {
  return $_[0]->{logger};
}    

sub port {
  return $_[0]->{port};
}
                                   

1;
__END__
