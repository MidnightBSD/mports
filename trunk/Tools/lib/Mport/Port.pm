package Mport::Port;
#
# $MidnightBSD$
#
use strict;
use warnings;
use Cwd;
use Fatal qw(chdir);
use Text::ParseWords qw(shellwords);

use Mport::Index;
use Mport::Globals qw($MAKE);

=head2 Mport::Port->new()

Create a Mport::Port object.  If given a hashref as an argument, this method
is a simple constructor.  If given a string, then an attempt is made to find 
port in the index.

=cut

sub new {
  my $class = shift;
  
  if (ref $_[0] && ref $_[0] eq 'HASH') {
    return $class->_new_from_hash($_[0]);
  } else {
    return Mport::Index->find_port($_[0]);
  }
}

sub name   { return $_[0]->{'name'}   }
sub origin { return $_[0]->{'origin'} } 

sub make {
  my $self = shift;
  
  $self->_to_orig;
  system($MAKE, @_);  
  $self->_leave_orig;
}

sub _to_orig {
  my ($self) = @_;
  
  $self->{'_cwd'} = getcwd();
  
  chdir($self->origin);
}

sub _leave_orig {
  my ($self) = @_;
  
  chdir($self->{'_cwd'});
}

sub options {
  my ($self) = @_;
 
  unless ($self->{'options'}) {
 
    my @opts = shellwords($self->_make_var('OPTIONS'));
    $self->{'options'} = {};
 
    while (@opts) {
      my $var = shift @opts;
      shift @opts;  # var description
      my $value = shift @opts;
      $self->{'options'}->{$var} = $value eq 'On' ? 1 : 0;
    }
  }
  
  return $self->{'options'};
}

sub _make_var {
  my ($self, @vars) = @_;
  
  my $args = join(' ', map { "-V $_" } @vars);
  
  $self->_to_orig;
  my @ret = `$MAKE $args`;
  $self->_leave_orig;

  return wantarray ? @ret : join("\n", @ret);
}

1;
__END__
