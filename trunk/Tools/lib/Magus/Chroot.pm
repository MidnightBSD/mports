package Magus::Chroot;

use strict;
use warnings;
use File::Temp qw(tempdir);

my $tarball = '0.2-CURRENT-20070901.tar';

sub new {
  my ($class, %args) = @_;
  
  my $self = bless {
    workdir   => '/tmp/workdir',
    tarball   => $tarball,
    localbase => '/usr/local',
    x11base   => '/usr/X11R6',
    loopbacks => [qw(/usr/mports /usr/src)],
    %args,
  }, $class;
  
  $self->_init;
  
  return $self;
}


sub _init {
  my ($self) = @_;
  $self->{'root'} = tempdir();

  system(qq(/usr/bin/tar xf $self->{tarball} -C $self->{'root'})) == 0 
    or die "Couldn't untar root tarball: $?\n";
    
  foreach my $dir (@{$self->{loopbacks}}) {
    $self->_mkdir($dir);
    system("/sbin/mount -t nullfs -o ro $dir $self->{root}/$dir") == 0
      or die "mount returned non-zer	o: $?\n";
  }
  
  $self->_mtree('BSD.root.dist', '/');  
  $self->_mtree('BSD.var.dist', '/var');
  $self->_mtree('BSD.usr.dist', '/usr');
  
  for (qw(workdir x11base)) {  
    $self->_mkdir($self->{$_});
  }
  
  $self->_mtree('BSD.local.dist', $self->{localbase});
  $self->_mtree('BSD.x11-4.dist', $self->{x11base});
  
  system("/sbin/mount -t devfs devfs $self->{root}/dev");
}

sub root {
  return $_[0]->{'root'};
}

sub _mtree {
  my ($self, $mtreefile, $dir) = @_;
  
  system("/usr/sbin/mtree -deU -f $self->{root}/usr/src/etc/mtree/$mtreefile -p $self->{root}$dir >/dev/null 2>&1")
}

sub _mkdir {
  my ($self, $dir) = @_;
  
  mkdir("$self->{root}/$dir") ||
    die "Couldn't mkdir $self->{root}/$dir: $!\n";
}

1;
__END__



