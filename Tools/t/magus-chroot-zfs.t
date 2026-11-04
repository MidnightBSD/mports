use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use File::Temp qw(tempfile);
use Test::More;

use Magus::Chroot;

{
  my ($fh, $tarball) = tempfile();
  my $original = "first bootstrap\n";
  my $replacement = "other bootstrap\n";
  is(length($replacement), length($original),
    'checksum regression test uses same-sized bootstrap contents');

  print $fh $original;
  close($fh) || die "Couldn't close temporary bootstrap: $!";
  my @original_stat = stat($tarball);

  my $chroot = bless {tarball => $tarball}, 'Magus::Chroot';
  my $first = $chroot->_tarball_checksum;

  sleep(1);
  open($fh, '>', $tarball) || die "Couldn't update temporary bootstrap: $!";
  print $fh $replacement;
  close($fh) || die "Couldn't close temporary bootstrap: $!";
  utime($original_stat[8], $original_stat[9], $tarball)
    || die "Couldn't restore temporary bootstrap timestamps: $!";
  my @replacement_stat = stat($tarball);

  is($replacement_stat[7], $original_stat[7], 'replacement preserves bootstrap size');
  is($replacement_stat[9], $original_stat[9], 'replacement restores bootstrap mtime');
  isnt($replacement_stat[10], $original_stat[10], 'replacement changes bootstrap ctime');

  my $second = $chroot->_tarball_checksum;

  isnt($second, $first,
    'bootstrap checksum is recalculated when only ctime identifies the change');
  like($second, qr/\A[0-9a-f]{64}\z/, 'bootstrap uses a SHA-256 checksum');
}

sub zfs_object {
  return bless {
    branch          => '4.0-RELEASE',
    workerid        => 2,
    memoryDisk      => 0,
    zfs             => 1,
    zfsDatasetRoot  => 'tank/magus',
    prefix          => '/usr/magus/slave-data/chroots',
  }, 'Magus::Chroot';
}

{
  my $chroot = zfs_object();
  $chroot->_validate_zfs_config;
  is($chroot->{zfsBranchDataset}, 'tank/magus/4.0-RELEASE',
    'release dataset is scoped below the configured parent');
  is($chroot->{zfsWorkerDataset}, 'tank/magus/4.0-RELEASE/2',
    'worker dataset is scoped below the release dataset');
}

for my $invalid ('-tank/magus', 'tank/magus;destroy', 'tank/magus worker', 'tank//magus') {
  my $chroot = zfs_object();
  $chroot->{zfsDatasetRoot} = $invalid;
  eval { $chroot->_validate_zfs_config };
  like($@, qr/^Invalid ZFS dataset name:/, "rejects invalid dataset name $invalid");
}

{
  my $chroot = zfs_object();
  $chroot->{memoryDisk} = 1;
  eval { $chroot->_validate_zfs_config };
  like($@, qr/cannot both be enabled/, 'rejects ZFS and memory disk together');
}

{
  my $chroot = zfs_object();
  $chroot->{prefix} = '/usr/magus/../other';
  eval { $chroot->_validate_zfs_config };
  like($@, qr/cannot contain dot path components/,
    'rejects a ZFS mount prefix containing parent traversal');
}

{
  package Local::OwnedChroot;
  our @ISA = ('Magus::Chroot');
  sub _capture_command { return @{$_[0]->{capture_result}}; }
}

{
  my $chroot = bless {
    capture_result => [0, "1\tlocal\n"],
  }, 'Local::OwnedChroot';
  ok(eval { $chroot->_assert_zfs_owned('tank/magus/worker'); 1 },
    'accepts a locally marked Magus dataset');

  $chroot->{capture_result} = [0, "1\tinherited from tank/magus\n"];
  eval { $chroot->_assert_zfs_owned('tank/magus/worker') };
  like($@, qr/Refusing to manage unowned ZFS dataset/,
    'rejects a dataset with only an inherited ownership marker');
}

{
  my $dataset = 'tank/magus/4.0-RELEASE/2';
  my $chroot = bless {
    zfsWorkerDataset => $dataset,
    capture_result   => [0, "$dataset\n$dataset\@magus-clean\n$dataset/unexpected\n"],
  }, 'Local::OwnedChroot';
  eval { $chroot->_assert_zfs_worker_contents };
  like($@, qr/Refusing to destroy unexpected ZFS child or snapshot/,
    'refuses startup refresh when the worker has unexpected children');
}

{
  package Local::RefreshChroot;
  our @ISA = ('Magus::Chroot');
  sub _zfs_dataset_exists {
    my ($self, $name) = @_;
    return $self->{exists}{$name} || 0;
  }
  sub _assert_zfs_worker_dataset { push @{$_[0]->{events}}, 'assert-worker'; }
  sub _unmount_loopbacks { push @{$_[0]->{events}}, 'unmount-strict'; }
  sub _assert_zfs_worker_contents { push @{$_[0]->{events}}, 'assert-contents'; }
  sub _must_run {
    my ($self, @command) = @_;
    push @{$self->{events}}, join(' ', @command);
  }
  sub _ensure_zfs_worker_dataset { push @{$_[0]->{events}}, 'ensure-worker'; return 1; }
  sub _sync_reference_dir { push @{$_[0]->{events}}, 'sync-reference'; }
  sub _create_zfs_snapshot { push @{$_[0]->{events}}, 'create-snapshot'; }
  sub _mount_loopbacks { push @{$_[0]->{events}}, 'mount-loopbacks'; }
}

{
  my $dataset = 'tank/magus/4.0-RELEASE/2';
  my $snapshot = "$dataset\@magus-clean";
  my $chroot = bless {
    zfsWorkerDataset => $dataset,
    exists           => {$dataset => 1, $snapshot => 1},
    events           => [],
  }, 'Local::RefreshChroot';

  $chroot->_refresh_zfs_baseline;
  is_deeply($chroot->{events}, [
    'assert-worker',
    'unmount-strict',
    'assert-contents',
    "/sbin/zfs destroy $snapshot",
    "/sbin/zfs destroy $dataset",
    'ensure-worker',
    'sync-reference',
    'create-snapshot',
    'mount-loopbacks',
  ], 'startup refresh destroys only the validated worker baseline and recreates it');
}

{
  my $dataset = 'tank/magus/4.0-RELEASE/2';
  my $chroot = bless {
    zfsWorkerDataset => $dataset,
    events           => [],
  }, 'Local::RefreshChroot';

  $chroot->_clean_zfs;
  is_deeply($chroot->{events}, [
    'unmount-strict',
    'assert-contents',
    "/sbin/zfs rollback $dataset\@magus-clean",
    'mount-loopbacks',
  ], 'ordinary cleanup rolls back the fixed baseline snapshot');
}

done_testing();
