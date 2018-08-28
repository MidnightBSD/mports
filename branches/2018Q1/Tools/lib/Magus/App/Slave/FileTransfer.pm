package Magus::App::Slave::FileTransfer;

use strict;
use warnings;

=head1 Magus::FileTransfer

A utility class (set of classes really) for moving files around.

=cut

use Magus::App::Slave::FileTransfer::LocalFS;
use Magus::App::Slave::FileTransfer::SFTP;

my %valid_classes = map { $_ => 1 } qw(LocalFS SFTP);

=head1 API

=head2 new(%args)

Creates a new file transfer object.  

  run    => $magusRunObject
  
Optional arguments:

  transfer_mode => LocalFS|SFTP

If transfer_mode is not give, then the value in %Magus::Config is used.

=cut

sub new {
  shift;  # we don't care about the class we're called as.  We've got a 
          # configuration directive to set the class

  my (%args) = @_;

  my $mode = delete $args{TransferMode} || $Magus::Config{TransferMode};
  
  $valid_classes{$mode} || die "Invalid TransferMode: $mode\n";

  my $class  = __PACKAGE__ . $mode;
  
  return $class->new(%args);
}

=head2 get_distfile($url, $destination_dir)

Takes a url to a distfile, and transfers the file to the correct location in the chroot.

=head2 get_pkgfile($port, $destination_dir)

Get the package file for the given port object, and place it in the destination dir.

=head2 put_pkgfile($port, $local_dir)

Upload a pkg file for the given port, finding the file in $local_dir.

=head2 get_run_tarball($run, $destination_dir)

Get the run tarball from the master.

=cut

1;
__END__


  
  
  

