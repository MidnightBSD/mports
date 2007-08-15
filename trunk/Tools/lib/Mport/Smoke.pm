package Mport::Smoke;
#
# $MidnightBSD$
#

use strict;
use warnings;
use File::Temp qw(tmpdir);
use YAML;
use DBI;

sub new {
  my ($class, $config) = @_;
  
  my $self = {};
  
  $self->{config} = Load($config);

  bless($self, $class);

  $self->_connect_db();
  
  return $self;
}

#
# $smoke->test($port)
#
# Test a single port.  This function will return non-sensical results 
# if you have't already tested the dependencies.
#
sub test {
  my ($self, $port) = @_;
  
  my $root = $self->_setup_chroot();
  
  # we fork so just the child chroot's, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish.
    waitpid($pid);
  } elsif (defined $pid) {
    # Child, chroot and go.
    chroot($root);
    chdir($port->abs_orig);
  
    my $res = `$MAKE install 2>&1`;
  
    $self->_store_results($port, $?, $res);
    exit(0);
  } else {
    die "Could not fork: $!\n";
  } 
}


sub _setup_chroot {
  my ($self) = @_;
  my $root = tmpdir();
  
  system(qw(/usr/bin/tar xfz $self->{config}->{chroot_tarball} -C $root)) == 0 
    or die "Couldn't untar root tarball: $?\n";
   
  return $root;
}


sub _connect_db {
  my ($self) = @_;
  
  $self->{dbh} = DBI->connect("dbi:SQLite:dbname=$self->{config}->{dbfile}", "", "", 
    { RaiseError => 1, PrintError => 0 }
  );
} 

1;
__END__

