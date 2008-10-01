package Magus::App::Slave::Worker;

use strict;
use warnings;

sub run {
  my ($class, %args) = @_;
  
  local $SIG{CHLD} = 'DEFAULT';
  local $SIG{INT}  = { die "SIGINT\n" };
  
  my $self = bless \%args, $class;
  
  eval {
        $self->{port} = $self->{lock}->port;
        $self->{port}->note_event(info => "Test Started");
	$self->_prep_chroot();
	$self->_inject_depends();
  	$self->_run_test();
  	$self->{port}->note_event($self->{port}->status => "Test complete.");
  }; 
  
  if ($@) {
	if ($@ =~ m/DBI/ || $@ =~ m/SIGINT/) {
		return;
	} 
	
	# we make sure we never have an uncaught exception!
	eval { $self->{port}->set_result_internal("Exception thrown: $@"); };
  }
}

sub _prep_chroot {
  my ($self) = @_;
 
  report(debug => "Preping chroot $self->{worker_id}");
  
  $self->{chroot} =  Magus::Chroot->new(
    workerid => $self->{worker_id},
    tarball  => $Magus::Config{ChrootTarBall},
  );
}


sub _inject_depends {
  my ($self) = @_;
  
  foreach my $depend ($self->{port}->all_depends) {
    if ($depend->status eq 'pass' || $depend->status eq 'warn') {
      # There should be a package that we can use to install the port.
      $self->_inject_pkgfile($depend);
      next;
    }
  
    die "Port was scheduled as ready to build, but $depend had not been built successfuly.\n";
  }
}

sub _inject_pkgfile {
  my ($self) = @_;
  
  my $port = $self->{port};
  my $chroot = $self->{chroot};
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
                                                                                
                                                             
sub _run_test {
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
      report('info', "Building $port");
      my $results = $test->run;
  
      $self->_insert_results($results);
    };
    
    if ($@) {
      if ($@ =~ m/SIGINT/ || $@ =~ m/DBI/) {
        exit(0);
      }
      # make sure we get to that exit() down there. 
      eval { $port->set_result_internal("Exception thrown: $@"); };
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
        $self->_upload_pkgfile();
    }
  } else {
    die "Child exited unexpectantly: $?\n";
  }
}  



=head2 upload_pkgfile($port, $file)  
  
Upload the built package of the current port to the master dir. 
    
=cut
    
sub upload_pkgfile {
  my ($self) = @_;
  my ($port, $chroot) = ($self->{port}, $self->{chroot});
  my $run  = $port->run->id;

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
  
  my $cmd = "/usr/bin/scp $from $Magus::Config{'PkgfilesRoot'}/$run/$file";

  report('debug', "uploading: $run/$file");
  
  my $out = `$cmd 2>&1`;

  if ($? != 0 ) {
     die "$cmd returned non-zero: $out\n";
  }
} 
                                   

1;
__END__
