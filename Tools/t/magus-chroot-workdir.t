use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use File::Path qw(make_path);
use File::Temp qw(tempdir);
use Test::More;

use Magus::Chroot;

my $root = tempdir(CLEANUP => 1);
my $workdir = '/magus/work';
make_path("$root$workdir");

my $chroot = bless {
  root => $root,
  workdir => $workdir,
}, 'Magus::Chroot';

ok($chroot->assert_workdir_empty, 'empty work directory is accepted');

open(my $fh, '>', "$root$workdir/stale-work")
  or die "Could not create stale work file: $!";
close($fh) or die "Could not close stale work file: $!";

my $ok = eval { $chroot->assert_workdir_empty; 1 };
ok(!$ok, 'non-empty work directory is rejected');
like($@, qr/stale-work/, 'error identifies the retained entry');

done_testing();
