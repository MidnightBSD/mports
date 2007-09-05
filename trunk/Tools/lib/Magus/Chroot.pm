package Magus::Chroot;
#
# Copyright (c) 2007 Chris Reinhardt. All rights reserved.
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
# $MidnightBSD: mports/Tools/scripts/chkfake.pl,v 1.5 2007/08/27 05:42:41 laffer1 Exp $
#
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;
use File::Path qw(mkpath);

=head1 NAME 

Magus::Chroot

=head1 SYNOPSIS

  use Magus::Chroot;
  
  my $chroot = Magus::Chroot->new(
    branch => 'RELENG_0_1',
    root   => '/usr/magus',
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

sub new {
  my ($class, %args) = @_;
  
  my $self = bless {
    branch    => 'current',
    prefix    => '/usr/magus',
    # This are relative to $prefix/$branch
    localbase => '/usr/local',
    x11base   => '/usr/X11R6',
    packages  => '/magus/packages',
    distfiles => '/magus/distfiles',
    workdir   => '/magus/work',    
    loopbacks => [qw(/usr/mports /usr/src)],
    %args,
  }, $class;

  die __PACKAGE__ . "->new(): No tarball given.\n" unless $self->{'tarball'};
  
  $self->_init;
  
  return $self;
}


sub _init {
  my ($self) = @_;
  
  $self->{root} = "$self->{prefix}/$self->{branch}";
  
  # if the chroot dir exists and is clean, then we're done.
  return if -e "$self->{root}/.clean";
  
  # clean things up if the dir exists and is dirty
  return $self->_clean if -e "$self->{root}/.dirty";
  
  # nuke it if it is dead.
  $self->delete if -e "$self->{root}/.dead";
  
  mkpath($self->{root}); 

  system(qq(/usr/bin/tar xf $self->{tarball} -C $self->{root})) == 0 
    or die "Couldn't untar root tarball: $?\n";
    
  foreach my $dir (@{$self->{loopbacks}}) {
    $self->_mkdir($dir);
    system("/sbin/mount -t nullfs -o ro $dir $self->{root}/$dir") == 0
      or die "mount returned non-zer	o: $?\n";
  }
  
  $self->_mtree('BSD.root.dist', '/');  
  $self->_mtree('BSD.var.dist', '/var');
  $self->_mtree('BSD.usr.dist', '/usr');
  
  for (qw(workdir x11base packages distfiles)) {  
    $self->_mkdir($self->{$_});
  }
  
  $self->_mtree('BSD.local.dist', $self->{localbase});
  $self->_mtree('BSD.x11-4.dist', $self->{x11base});
  
  system("/sbin/mount -t devfs devfs $self->{root}/dev");
}


#
# Nuke the workdir, packages, x11base and localbase and then recreate them.
# 
sub _clean {
  my ($self) = @_;
  
  for (qw(workdir x11base localbase packages)) {
    rmpath("$self->{root}/$self->{$_}");
    $self->_mkdir($self->{$_});
  }
  
  $self->_mtree('BSD.local.dist', $self->{localbase});
  $self->_mtree('BSD.x11-4.dist', $self->{x11base});
  
  unlink("$self->{root}/.dirty");
  my $tmp;
  open($tmp, '>', "$self->{root}/.clean") && close($tmp) 
    || die "Couldn'touch $self->{root}/.clean\n";
}


sub _mtree {
  my ($self, $mtreefile, $dir) = @_;
  
  system("/usr/sbin/mtree -deU -f $self->{root}/usr/src/etc/mtree/$mtreefile -p $self->{root}$dir >/dev/null 2>&1");
}

sub _mkdir {
  my ($self, $dir) = @_;
  
  mkpath("$self->{root}/$dir") ||
    die "Couldn't mkdir $self->{root}/$dir: $!\n";
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


=head2 $chroot->delete

Deletes the chroot dir.

=cut

sub delete {
  my ($self) = @_;
  
  for (qw(/dev /usr/src /usr/mports)) {
    system("/sbin/umount $self->{root}$_") == 0 
      or die "umount returned non-zero: $?\n";
  }
  
  system("/sbin/chflags 0 $self->{root}/var/empty") == 0 
    or die "chflags returned non-zero: $?\n";
  
  rmpath($self->root);
}

1;
__END__



