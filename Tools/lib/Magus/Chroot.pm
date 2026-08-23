package Magus::Chroot;
#
# Copyright (c) 2008-2026 Lucas Holt
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

use strict;
use warnings;
use Digest::SHA ();
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
my %TarballChecksums;

my $ZfsOwnershipProperty = 'org.midnightbsd:magus-chroot';
my $ZfsSnapshotName      = 'magus-clean';

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
    memoryDisk  => $Magus::Config{MemoryDiskEnabled},
    memoryDiskSize => $Magus::Config{MemoryDiskSize},
    zfs         => $Magus::Config{ZfsChrootEnabled},
    zfsDatasetRoot => $Magus::Config{ZfsChrootDataset},
    refresh_snapshot => 0,
    loopbacks   => {
      "$Magus::Config{SlaveMportsDir}" => "/usr/mports",
      "$Magus::Config{SlaveSrcDir}"    => "/usr/src",
    },
    %args,
  }, $class;

  die __PACKAGE__ . "->new(): No tarball given.\n" unless $self->{'tarball'};

  $self->_validate_zfs_config;
  
  $self->_init;
  
  return $self;
}


sub _init {
  my ($self) = @_;

  $self->_create_reference_dir;
  
  $self->{root} = "$self->{prefix}/$self->{branch}/$self->{workerid}";

  return $self->_init_zfs if $self->{zfs};

  $self->_init_cpdup;
}


sub _init_cpdup {
  my ($self) = @_;

  # check to make sure that things are working properly in the chroot, a restart
  # or deleting /usr/mports can break the loopback.
  if (-d $self->{root} && !-e "$self->{root}/usr/mports/Makefile") {
    $self->delete;
  }
  
  # if the chroot dir exists and is clean and matches the current reference,
  # then we're done.
  return if -e "$self->{root}/.clean" && $self->_root_matches_reference;

  # A clean chroot from an older bootstrap still needs to be refreshed.
  if (-e "$self->{root}/.clean") {
    unlink("$self->{root}/.clean");
    $self->_touchfile('/.dirty');
  }
  
  # clean things up if the dir exists and is dirty
  return $self->_clean if -e "$self->{root}/.dirty";
  
  # nuke it if it is dead.
  $self->delete if -e "$self->{root}/.dead";

  mkpath($self->{root});

  if ($self->{memoryDisk}) {
    $self->_run_command('/sbin/mdconfig', '-a', '-t', 'swap', '-s', $self->{memoryDiskSize}, '-u', $self->{workerid})
      or die "Couldn't create memory disk: $?\n";

    $self->_run_command('/sbin/newfs', "/dev/md$self->{workerid}")
      or die "Couldn't newfs memory disk: $?\n";

    $self->_run_command('/sbin/mount', "/dev/md$self->{workerid}", $self->{root})
      or die "Couldn't mount memory disk: $?\n";
  }
   
  $self->_sync_reference_dir;
  $self->_mount_loopbacks;
}


sub _create_reference_dir {
  my ($self) = @_;
  
  $self->{refdir} = "$self->{prefix}/$self->{branch}/reference";
  
  # Calculate the actual tarball checksum once per daemon process.  Do not
  # trust the old cached .md5 sidecar when the tarball may have been replaced
  # at the same path between Magus starts.
  my $tarballsum = $self->_tarball_checksum;
  $self->{referenceChecksum} = $tarballsum;

  # get the refdir checksum and check if it matches the tarball sum.
  if (open(my $fh, '<', "$self->{refdir}/.checksum")) {
    my $refdirsum = <$fh>;
    close($fh);
    
    chomp($refdirsum);
    
    # if the checksums are the same, then the right tarball is already extracted, and we're done.
    return if $refdirsum eq $tarballsum;
  }
    
  if (-e $self->{refdir}) {
    rmtree($self->{refdir}) || die "Couldn't delete $self->{refdir} $!\n";
  }
  
  mkpath($self->{refdir});
  
  $self->_run_command('/usr/bin/tar', 'xf', $self->{tarball}, '-C', $self->{refdir})
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


sub _tarball_checksum {
  my ($self) = @_;

  my @stat = stat($self->{tarball});
  die "Couldn't stat $self->{tarball}: $!\n" unless @stat;

  # Include ctime so same-sized replacements that restore the old mtime still
  # invalidate the per-daemon checksum cache.
  my $identity = join(':', @stat[0, 1, 7, 9, 10]);
  my $cached = $TarballChecksums{$self->{tarball}};
  return $cached->{checksum} if $cached && $cached->{identity} eq $identity;

  open(my $fh, '<', $self->{tarball})
    or die "Couldn't open $self->{tarball}: $!\n";
  binmode($fh);
  my $sha = Digest::SHA->new(256);
  $sha->addfile($fh);
  close($fh) || die "Couldn't close $self->{tarball}: $!\n";

  my $checksum = $sha->hexdigest;
  $TarballChecksums{$self->{tarball}} = {
    identity => $identity,
    checksum => $checksum,
  };

  return $checksum;
}


sub _root_matches_reference {
  my ($self) = @_;

  open(my $fh, '<', "$self->{root}/.checksum") || return;
  chomp(my $checksum = <$fh>);
  close($fh) || die "Couldn't close $self->{root}/.checksum: $!\n";

  return $checksum eq $self->{referenceChecksum};
}


sub _validate_zfs_config {
  my ($self) = @_;

  return unless $self->{zfs};

  die "ZFS chroots and memory disk chroots cannot both be enabled.\n"
    if $self->{memoryDisk};
  die "ZfsChrootDataset must be set when ZfsChrootEnabled is enabled.\n"
    unless defined($self->{zfsDatasetRoot}) && length($self->{zfsDatasetRoot});
  die "Invalid ZFS dataset name: $self->{zfsDatasetRoot}\n"
    unless $self->{zfsDatasetRoot} =~
      m{\A[A-Za-z0-9][A-Za-z0-9_.:-]*(?:/[A-Za-z0-9][A-Za-z0-9_.:-]*)*\z};
  die "Invalid OS release component for ZFS dataset: $self->{branch}\n"
    unless $self->{branch} =~ m{\A[A-Za-z0-9][A-Za-z0-9_.:-]*\z};
  die "Invalid worker ID for ZFS dataset: $self->{workerid}\n"
    unless defined($self->{workerid}) && $self->{workerid} =~ m{\A[1-9][0-9]*\z};
  die "Invalid chroot prefix for ZFS mountpoints: $self->{prefix}\n"
    unless defined($self->{prefix}) && $self->{prefix} =~
      m{\A/(?:[A-Za-z0-9_.:-]+/)*[A-Za-z0-9_.:-]+\z};
  die "ZFS chroot prefix cannot contain dot path components.\n"
    if grep { $_ eq '.' || $_ eq '..' } split(m{/}, $self->{prefix});

  $self->{zfsBranchDataset} = "$self->{zfsDatasetRoot}/$self->{branch}";
  $self->{zfsWorkerDataset} = "$self->{zfsBranchDataset}/$self->{workerid}";
}


sub _init_zfs {
  my ($self) = @_;

  $self->_ensure_zfs_hierarchy;

  if ($self->{refresh_snapshot}) {
    $self->_refresh_zfs_baseline;
    return;
  }

  my $created = $self->_ensure_zfs_worker_dataset;
  if ($created) {
    $self->_sync_reference_dir;
    $self->_create_zfs_snapshot;
    $self->_mount_loopbacks;
    return;
  }

  $self->_assert_zfs_worker_dataset;
  die "Missing ZFS baseline snapshot " . $self->_zfs_snapshot . "\n"
    unless $self->_zfs_dataset_exists($self->_zfs_snapshot);

  if (-e "$self->{root}/.dirty") {
    $self->_clean_zfs;
    return;
  }

  if (-e "$self->{root}/.dead") {
    $self->_refresh_zfs_baseline;
    return;
  }

  die "ZFS chroot $self->{root} does not match the current bootstrap.\n"
    unless -e "$self->{root}/.clean" && $self->_root_matches_reference;

  # A restart can leave the dataset mounted without its auxiliary mounts.
  unless (-e "$self->{root}/usr/mports/Makefile") {
    $self->_unmount_loopbacks(1);
    $self->_mount_loopbacks;
  }
}


sub _ensure_zfs_hierarchy {
  my ($self) = @_;

  die "Configured ZFS parent dataset $self->{zfsDatasetRoot} does not exist.\n"
    unless $self->_zfs_dataset_exists($self->{zfsDatasetRoot});

  if ($self->_zfs_dataset_exists($self->{zfsBranchDataset})) {
    $self->_assert_zfs_branch_dataset;
  } else {
    $self->_must_run(
      '/sbin/zfs', 'create',
      '-o', 'canmount=off',
      '-o', 'mountpoint=none',
      '-o', "$ZfsOwnershipProperty=1",
      $self->{zfsBranchDataset},
    );
  }

  mkpath("$self->{prefix}/$self->{branch}");
}


sub _assert_zfs_branch_dataset {
  my ($self) = @_;

  $self->_assert_zfs_owned($self->{zfsBranchDataset});
  my $mountpoint = $self->_zfs_get('mountpoint', $self->{zfsBranchDataset});
  my $canmount = $self->_zfs_get('canmount', $self->{zfsBranchDataset});
  die "ZFS branch dataset $self->{zfsBranchDataset} must have mountpoint=none and canmount=off.\n"
    unless $mountpoint eq 'none' && $canmount eq 'off';
}


sub _ensure_zfs_worker_dataset {
  my ($self) = @_;

  return 0 if $self->_zfs_dataset_exists($self->{zfsWorkerDataset});

  if (-d $self->{root}) {
    opendir(my $dh, $self->{root})
      or die "Couldn't open $self->{root}: $!\n";
    my @entries = grep { $_ ne '.' && $_ ne '..' } readdir($dh);
    closedir($dh) || die "Couldn't close $self->{root}: $!\n";
    die "Refusing to mount a ZFS chroot over non-empty $self->{root}.\n"
      if @entries;
  }

  $self->_must_run(
    '/sbin/zfs', 'create',
    '-o', 'canmount=on',
    '-o', "mountpoint=$self->{root}",
    '-o', "$ZfsOwnershipProperty=1",
    $self->{zfsWorkerDataset},
  );

  $self->_assert_zfs_worker_dataset;
  return 1;
}


sub _refresh_zfs_baseline {
  my ($self) = @_;

  if ($self->_zfs_dataset_exists($self->{zfsWorkerDataset})) {
    $self->_assert_zfs_worker_dataset;
    $self->_unmount_loopbacks(1);
    $self->_assert_zfs_worker_contents;

    my $snapshot = $self->_zfs_snapshot;
    $self->_must_run('/sbin/zfs', 'destroy', $snapshot)
      if $self->_zfs_dataset_exists($snapshot);
    $self->_must_run('/sbin/zfs', 'destroy', $self->{zfsWorkerDataset});
  }

  $self->_ensure_zfs_worker_dataset;
  $self->_sync_reference_dir;
  $self->_create_zfs_snapshot;
  $self->_mount_loopbacks;
}


sub _clean_zfs {
  my ($self) = @_;

  $self->_unmount_loopbacks(1);
  $self->_assert_zfs_worker_contents;
  $self->_must_run('/sbin/zfs', 'rollback', $self->_zfs_snapshot);
  $self->_mount_loopbacks;
}


sub _create_zfs_snapshot {
  my ($self) = @_;

  my $snapshot = $self->_zfs_snapshot;
  die "Refusing to replace unexpected existing snapshot $snapshot.\n"
    if $self->_zfs_dataset_exists($snapshot);
  $self->_must_run('/sbin/zfs', 'snapshot', $snapshot);
}


sub _zfs_snapshot {
  my ($self) = @_;
  return "$self->{zfsWorkerDataset}\@$ZfsSnapshotName";
}


sub _assert_zfs_worker_dataset {
  my ($self) = @_;

  $self->_assert_zfs_owned($self->{zfsWorkerDataset});
  my $mountpoint = $self->_zfs_get('mountpoint', $self->{zfsWorkerDataset});
  die "ZFS dataset $self->{zfsWorkerDataset} has unexpected mountpoint $mountpoint.\n"
    unless $mountpoint eq $self->{root};

  my $mounted = $self->_zfs_get('mounted', $self->{zfsWorkerDataset});
  $self->_must_run('/sbin/zfs', 'mount', $self->{zfsWorkerDataset})
    unless $mounted eq 'yes';
}


sub _assert_zfs_owned {
  my ($self, $dataset) = @_;

  my ($exit, $output) = $self->_capture_command(
    '/sbin/zfs', 'get', '-H', '-o', 'value,source',
    $ZfsOwnershipProperty, $dataset,
  );
  die "Couldn't verify Magus ownership of ZFS dataset $dataset.\n" if $exit;
  chomp($output);
  my ($value, $source) = split(/\t/, $output, 2);
  die "Refusing to manage unowned ZFS dataset $dataset.\n"
    unless defined($value) && $value eq '1' && defined($source) && $source eq 'local';
}


sub _assert_zfs_worker_contents {
  my ($self) = @_;

  my ($exit, $output) = $self->_capture_command(
    '/sbin/zfs', 'list', '-H', '-r', '-o', 'name',
    '-t', 'filesystem,snapshot', $self->{zfsWorkerDataset},
  );
  die "Couldn't inspect ZFS dataset $self->{zfsWorkerDataset}.\n" if $exit;

  my %allowed = map { $_ => 1 } ($self->{zfsWorkerDataset}, $self->_zfs_snapshot);
  for my $name (grep { length } split(/\n/, $output)) {
    die "Refusing to destroy unexpected ZFS child or snapshot $name.\n"
      unless $allowed{$name};
  }
}


sub _zfs_get {
  my ($self, $property, $dataset) = @_;

  my ($exit, $output) = $self->_capture_command(
    '/sbin/zfs', 'get', '-H', '-o', 'value', $property, $dataset,
  );
  die "Couldn't read ZFS property $property from $dataset.\n" if $exit;
  chomp($output);
  return $output;
}


sub _zfs_dataset_exists {
  my ($self, $dataset) = @_;

  my ($exit, $output) = $self->_capture_command(
    '/sbin/zfs', 'list', '-H', '-o', 'name', $dataset,
  );
  return 0 if $exit;
  chomp($output);
  return $output eq $dataset;
}


sub _capture_command {
  my ($self, @command) = @_;

  open(my $fh, '-|', @command)
    or die "Couldn't run $command[0]: $!\n";
  local $/;
  my $output = <$fh>;
  $output = '' unless defined $output;
  close($fh);
  my $status = $?;
  my $exit = $status == -1 ? 255
           : ($status & 127) ? 128 + ($status & 127)
           : $status >> 8;

  return ($exit, $output);
}


sub _run_command {
  my ($self, @command) = @_;
  return (system { $command[0] } @command) == 0;
}


sub _must_run {
  my ($self, @command) = @_;
  $self->_run_command(@command)
    or die "$command[0] returned non-zero: $?\n";
}


sub _sync_reference_dir {
  my ($self) = @_;
  
  $self->_run_command('/bin/cpdup', '-i0', '-s0', $self->{refdir}, $self->{root})
    or die "cpdup returned non-zero: $?\n";
}


sub _mount_loopbacks {
  my ($self) = @_;
  
  while (my ($src, $dst) = each %{$self->{loopbacks}}) {  
    $self->_mkdir($dst);
    $self->_run_command('/sbin/mount', '-t', 'nullfs', '-o', 'ro', $src, "$self->{root}/$dst")
      or die "mount returned non-zero: $?\n";
  }
  
  $self->_mkdir('dev');
  $self->_run_command('/sbin/mount', '-t', 'devfs', 'devfs', "$self->{root}/dev");

  $self->_mkdir('proc');
  $self->_run_command('/sbin/mount', '-t', 'procfs', 'procfs', "$self->{root}/proc");

  $self->_mkdir('compat/linux/proc');
  $self->_run_command('/sbin/mount', '-t', 'linprocfs', 'linprocfs', "$self->{root}/compat/linux/proc");

  $self->_mkdir('compat/linux/sys');
  $self->_run_command('/sbin/mount', '-t', 'linsysfs', 'linsysfs', "$self->{root}/compat/linux/sys");

  $self->_mkdir('compat/linux/dev');
  $self->_run_command('/sbin/mount', '-t', 'devfs', 'devfs', "$self->{root}/compat/linux/dev");

  $self->_mkdir('compat/linux/dev/fd');
  $self->_run_command('/sbin/mount', '-t', 'fdescfs', 'fdescfs', "$self->{root}/compat/linux/dev/fd");
} 

sub _unmount_loopbacks {
  my ($self, $strict) = @_;

  for ("/dev", "/proc", "/compat/linux/proc", "/compat/linux/sys", "/compat/linux/dev/fd", "/compat/linux/dev", values %{$self->{loopbacks}}) {
    # if umount failed it is probably because nothing was mounted.
    # therefore we ignore the error code here 
    $self->_run_command('/sbin/umount', "$self->{root}$_");
  }

  return unless $strict;

  my ($exit, $output) = $self->_capture_command('/sbin/mount', '-p');
  die "Couldn't verify mounts below $self->{root}.\n" if $exit;
  for my $line (split(/\n/, $output)) {
    my (undef, $mountpoint) = split(/\s+/, $line, 3);
    next unless defined $mountpoint;
    die "Refusing ZFS operation while $mountpoint remains mounted.\n"
      if index($mountpoint, "$self->{root}/") == 0;
  }
}

sub _clean {
  my ($self) = @_;

  return $self->_clean_zfs if $self->{zfs};

  $self->_unmount_loopbacks;
  
  #$self->_clear_flags("/");
  
  $self->_sync_reference_dir;
  $self->_mount_loopbacks;
}


sub _clear_flags {
  my ($self, $dir) = @_;

  $self->_run_command('/bin/chflags', '-R', '0', "$self->{root}$dir")
    or die "/bin/chflags returned non-zero: $?\n";
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

  if ($self->{zfs}) {
    return unless $self->_zfs_dataset_exists($self->{zfsWorkerDataset});

    $self->_assert_zfs_worker_dataset;
    $self->_unmount_loopbacks(1);
    $self->_assert_zfs_worker_contents;

    my $snapshot = $self->_zfs_snapshot;
    $self->_must_run('/sbin/zfs', 'destroy', $snapshot)
      if $self->_zfs_dataset_exists($snapshot);
    $self->_must_run('/sbin/zfs', 'destroy', $self->{zfsWorkerDataset});
    return;
  }
  
  $self->_unmount_loopbacks;

  if ($self->{memoryDisk}) {
    $self->_run_command('/sbin/umount', $self->{root})
      or die "Couldn't unmount memory disk: $?\n";

    $self->_run_command('/sbin/mdconfig', '-d', '-u', $self->{workerid})
      or die "Couldn't destroy memory disk: $?\n";
  } else {
    $self->_clear_flags("/");
    rmtree($self->root) || die "Couldn't rmtree $self->{root}: $!\n";
  }
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
