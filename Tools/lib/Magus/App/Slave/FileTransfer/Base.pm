package Magus::App::Slave::FileTransfer::Base;

use strict;
use warnings;

sub new {
  my ($class, %args) = @_;

  return bless \%args, $class;
}
 
=head2 get_distfile($url, $destination_dir)

Takes a url to a distfile, and transfers the file to the correct location in the chroot.

=cut

sub get_distfile {
  die "XXX - Don't know how this is going to work";
}


=head2 get_pkgfile($port, $destination_dir)

Get the package file for the given port object, and place it in the destination dir.

=cut

sub get_pkgfile {
  my ($class) = @_;
  
  die "$class has not implemented get_pkgfile();\n";
}


=head2 put_pkgfile($port, $local_dir)

Upload a pkg file for the given port, finding the file in $local_dir.

=cut

sub put_pkgfile {
  my ($class) = @_;
  
  die "$class has not implemented put_pkgfile();\n";
}



=head2 get_run_tarball($run, $destination_dir)

Get the run tarball from the master.

XXX - This needs to be cleaned up to be more flexible and configurable.

=cut
            
sub get_run_tarball {
  my ($self, $run, $dir) = @_;
  
  my $tarball = $run->tarballpath;
                      
  eval { $self->_system("/usr/bin/fetch -o $dir -p $tarball") };
  
  if ($@) {
    die "Couldn't fetch $tarball: $@";
  }
}



sub _system {
  my ($self, $cmd) = @_;
  
  local $SIG{CHLD} = 'DEFAULT';
    
  if (system($cmd) != 0) {
    if ($? == -1) {
      die qq{"$cmd" failed to execute: $!\n};
    } elsif ($? & 127) {
      my $dumped = ($? & 128) ? 'with' : 'without';
      my $sig = $? & 127;
      die qq{"$cmd" died with signal $sig, $dumped coredump\n},
    } else {
      my $exit = $? >> 8;
      die qq{"$cmd" exited non-zero: $exit\n};
    }
  }
  
  return 1;
}  
                                                                                                                                                                                                   
  
1;
__END__
                                                  