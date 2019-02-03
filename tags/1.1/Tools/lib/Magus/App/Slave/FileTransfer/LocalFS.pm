package Magus::App::Slave::FileTransfer::LocalFS;

use strict;
use warnings;

use base 'Magus::App::Slave::FileTransfer::Base';

use File::Copy;

 
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
  my ($class, $port, $destination) = @_;

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $path = join('/', $Magus::Config{'PkgfilesRoot'}, $port->run->id);
  
  $self->_copy("$path/$file", "$destination/$file");
}


=head2 put_pkgfile($port, $local_dir)

Upload a pkg file for the given port, finding the file in $local_dir.

=cut

sub put_pkgfile {
  my ($class, $port, $local) = @_;
  
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $dest = join('/', $Magus::Config{'PkgfilesRoot'}, $port->run->id);
  
  $self->_copy("$local/$file", "$dest/$file");  
}


sub _copy {
  my ($self, $from, $to) = @_;
  
  File::Copy::copy($from, $to) || die "Couldn't not cp $from $to: $!\n";
}

1;
__END__




1;
__END__
