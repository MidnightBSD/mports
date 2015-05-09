package Magus::Chroot;
#
# Copyright (c) 2007,2008 Chris Reinhardt. All rights reserved.
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
# $MidnightBSD$
#
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;
use File::Path qw(mkpath rmtree);

# load Carp::Heavy so it's in memory before we chroot.
use Carp::Heavy;

=head1 NAME 

Magus::Chroot

=head1 SYNOPSIS

  use Magus::Chroot;
  
  my $chroot = Magus::Chroot->new(
    tarball => $foo
  );
  
  print $chroot->root;
  
  $chroot->delete;
  
=head1 DESCRIPTION

This class provides the heavy lifting for creating and maintaning the chroot
directory for the Magus port testing framework.  

=head1 METHODS

=head2 Magus::Chroot->new()

Creates a new Chroot object.  This object may represent a new directory, or
an old cleaned up directory.  

=cut

my $Branch;

sub new {
  my ($class, %args) = @_;
  
  if (!$Branch) {
    $Branch = `uname -r`;
    chomp($Branch);
  }
  
  my $self = bless {
    prefix      => $Magus::Config{SlaveChrootsDir},
    branch      => $Branch,
    workerid    => 1,
    # This are relative to $prefix/$branch
    localbase   => '/usr/local',
    x11base     => '/usr/X11R6',
    linuxcompat => '/compat/linux',
    packages    => '/magus/packages',
    distfiles   => '/magus/distfiles',
    workdir     => '/magus/work',    
    logs        => '/magus/logs',
    loopbacks   => {
      "$Magus::Config{SlaveMportsDir}" => "/usr/mports",
      "$Magus::Config{SlaveSrcDir}"    => "/usr/src",
    },
    %args,
  }, $class;

  die __PACKAGE__ . "->new(): No tarball given.\n" unless $self->{'tarball'};
  
  $self->_init;
  
  return $self;
}


sub _init {
  my ($self) = @_;

  $self->_create_reference_dir;
  
  $self->{root} = "$self->{prefix}/$self->{branch}/$self->{workerid}";

  # check to make sure that things are working properly in the chroot, a restart
  # or deleting /usr/mports can break the loopback.
  if (-d $self->{root} && !-e "$self->{root}/usr/mports/Makefile") {
    $self->delete;
  }
  
  # if the chroot dir exists and is clean, then we're done.
  return if -e "$self->{root}/.clean";
  
  # clean things up if the dir exists and is dirty
  return $self->_clean if -e "$self->{root}/.dirty";
  
  # nuke it if it is dead.
  $self->delete if -e "$self->{root}/.dead";
  
  mkpath($self->{root}); 
   
  $self->_sync_reference_dir;
  $self->_mount_loopbacks;
}


sub _create_reference_dir {
  my ($self) = @_;
  
  $self->{refdir} = "$self->{prefix}/$self->{branch}/reference";
  
  # get the tarball checksum, caching it if needed.
  my $tarballsum;
  if (open(my $fh, '<', "$self->{tarball}.md5")) {
    chomp($tarballsum = <$fh>);
    close($fh) || die "Couldn't close $self->{tarball}.md5: $!\n";
  } else {
    chomp($tarballsum = `md5 -q $self->{tarball}`);
    open(my $fh, '>', "$self->{tarball}.md5") || die "Couldn't open $self->{tarball}.md5: $!\n";
    print $fh "$tarballsum\n";
    close($fh) || die "Couldn't close $self->{tarball}.md5: $!\n";
  }

  # get the refdir checksum and check if it matches the tarball sum.
  if (open(my $fh, '<', "$self->{refdir}/.checksum")) {
    my $refdirsum = <$fh>;
    close($fh);
    
    chomp($refdirsum);
    
    # if the checksums are the same, then the right tarball is alread extracted, and we're done.
    return if $refdirsum eq $tarballsum;
  }
    
  if (-e $self->{refdir}) {
    rmtree($self->{refdir}) || die "Couldn't delete $self->{refdir} $!\n";
  }
  
  mkpath($self->{refdir});
  
  system(qq(/usr/bin/tar xf $self->{tarball} -C $self->{refdir})) == 0 
    or die "Couldn't untar root tarball: $?\n";
  
  # for the rest of this scope, override root to the refdir, that will make these
  # methods do the right thing.
  local $self->{root} = $self->{refdir};
  
  symlink("usr/src/sys", "$self->{root}/sys") || die "Couldn't symlink /sys to /usr/src/sys: $!\n";
 
  $self->_mtree('BSD.root.dist', '/');  
  $self->_mtree('BSD.var.dist', '/var');
  $self->_mtree('BSD.usr.dist', '/usr');
  
  $self->_mkdir("/tmp") unless (-d "$self->{root}/tmp");
  
  for (qw(workdir x11base packages distfiles logs linuxcompat)) {  
    $self->_mkdir($self->{$_});
  }
  
  # Make sure that packages/All exists.
  $self->_mkdir("$self->{packages}/All");
  
  $self->_mtree('BSD.local.dist', $self->{localbase});
  $self->_mtree('BSD.x11-4.dist', $self->{x11base}) if $self->{x11base};
  
  $self->_touchfile('/.clean');
  
  open(my $fh, '>', "$self->{refdir}/.checksum") || die "Couldn't open .checksum: $!\n";
  print $fh "$tarballsum\n";
  close($fh) || die "Couldn't close .checksum: $!\n";
}


sub _sync_reference_dir {
  my ($self) = @_;
  
  system("/bin/cpdup -i0 -s0 $self->{refdir} $self->{root}") == 0 or die "cpdup returned non-zero: $?\n";
}


sub _mount_loopbacks {
  my ($self) = @_;
  
  while (my ($src, $dst) = each %{$self->{loopbacks}}) {  
    $self->_mkdir($dst);
    system("/sbin/mount -t nullfs -o ro $src $self->{root}/$dst") == 0
      or die "mount returned non-zero: $?\n";
  }
  
  $self->_mkdir('dev');
  system("/sbin/mount -t devfs devfs $self->{root}/dev");

  $self->_mkdir('proc');
  system("/sbin/mount -t procfs procfs $self->{root}/proc");

  $self->_mkdir('compat/linux/proc');
  system("/sbin/mount -t linprocfs linprocfs $self->{root}/compat/linux/proc");
} 

sub _unmount_loopbacks {
  my ($self) = @_;

  for ("/dev", "/proc", "/compat/linux/proc", values %{$self->{loopbacks}}) {
    # if umount failed it is probably because nothing was mounted.
    # therefore we ignore the error code here 
    system("/sbin/umount $self->{root}$_"); 
  }
}

sub _clean {
  my ($self) = @_;

  $self->_unmount_loopbacks;
  
  #$self->_clear_flags("/");
  
  $self->_sync_reference_dir;
  $self->_mount_loopbacks;
}


sub _clear_flags {
  my ($self, $dir) = @_;
  
  my $cmd = "/bin/chflags -R 0 $self->{root}$dir";
  
  (system($cmd) == 0)
      or die qq/"$cmd" returned non-zero: $?\n/;  
}
  

sub _mtree {
  my ($self, $mtreefile, $dir) = @_;

  my $cmd = "/usr/sbin/mtree -deU -f $self->{root}/etc/mtree/$mtreefile -p $self->{root}$dir >/dev/null 2>&1";
  
  (system($cmd) == 0)
    or die qq/"$cmd" returned non-zero: $?\n/; 
}

sub _mkdir {
  my ($self, $dir) = @_;
  
  mkpath("$self->{root}/$dir");
}


sub _touchfile {
  my ($self, $file) = @_; 
  my $tmp;
  open($tmp, '>>', "$self->{root}$file") || die "Couldn't open $self->{root}$file: $!\n";
  close($tmp)                            || die "Couldn't close $self->{root}$file: $!\n";  
}


=head2 $chroot->do_chroot

Calls the chroot syscall; making the chroot dir the root dir.  Use this
as it will keep the $chroot object usable.

=cut

sub do_chroot {
  my ($self) = @_;
  
  chroot($self->{root}) || die "Couldn't chroot to $self->{root}: $!\n";
  $self->{root} = '';
}

=head2 $chroot->root

Returns the root directory that the test system should chroot into.

=cut

sub root {
  return $_[0]->{'root'};
}


=head2 $chroot->workdir

Returns the directory that WORKDIRPREFIX should be set to.

=cut

sub workdir {
  return $_[0]->{'workdir'};
}


=head2 $chroot->distfiles

Returns the directory that DISTDIR should be set to.

=cut

sub distfiles {
  return $_[0]->{'distfiles'};
}


=head2 $chroot->packages

Returns the directory that PACKAGES should be set to.

=cut

sub packages {
  return $_[0]->{'packages'};
}


=head2 $chroot->logs

Returns the log file directory.

=cut

sub logs {
  return $_[0]->{'logs'};
}



=head2 $chroot->delete

Deletes the chroot dir.

=cut

sub delete {
  my ($self) = @_;
  
  $self->_unmount_loopbacks;
  $self->_clear_flags("/");
  
  rmtree($self->root) || die "Couldn't rmtree $self->{root}: $!\n";
}

=head2 $chroot->mark_dirty

Mark that the chroot needs cleanup before reuse.

=cut

sub mark_dirty {
  my ($self) = @_;
  
  unlink("$self->{root}/.clean");
  unlink("$self->{root}/.dead");
  $self->_touchfile("/.dirty");
}

=head2 $chroot->mark_dead

Make a chroot dead.  It cannot be reused.

=cut

sub mark_dead {
  my ($self) = @_;
  
  unlink("$self->{root}/.clean");
  unlink("$self->{root}/.dirty");
  $self->_touchfile("/.dead");
}



1;
__END__



