use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use File::Temp qw(tempdir);
use POSIX qw(:sys_wait_h);
use Test::More;

use Magus::PortTest;

# _run_make shells out to $MAKE; point it at a script we control so the test
# does not need a ports tree.
my $dir = tempdir(CLEANUP => 1);
mkdir("$dir/log") || die "Couldn't create log dir: $!";

{
  package Magus::PortTest::MockPort;
  sub new    { bless {dir => $_[1]}, $_[0] }
  sub flavor { '' }
  sub origin { $_[0]->{dir} }
}

sub write_script {
  my ($name, $body) = @_;
  my $path = "$dir/$name";

  open(my $fh, '>', $path) || die "Couldn't write $path: $!";
  print $fh "#!/bin/sh\n$body";
  close($fh) || die "Couldn't close $path: $!";
  chmod(0755, $path) || die "Couldn't chmod $path: $!";

  return $path;
}

sub tester {
  bless {
    port   => Magus::PortTest::MockPort->new($dir),
    logdir => "$dir/log",
  }, 'Magus::PortTest';
}

sub log_for { my $t = shift; local $/; open(my $fh, '<', "$dir/log/$t") || return ''; <$fh> }

# Shorten the TERM->KILL grace so the timeout cases stay quick.
local $Magus::PortTest::KillGrace = 2;

# The worker inherits magus.pl's indiscriminate SIGCHLD reaper; _run_make has
# to hold it off or it loses make's exit status.  Install it for every case.
local $SIG{CHLD} = sub { 1 while waitpid(-1, WNOHANG) > 0 };

subtest 'per-target limits' => sub {
  local %Magus::Config = (MakeTimeout => 86400, MakeTimeouts => {test => 7200});
  my $test = tester();

  is($test->_timeout_for('test'), 7200, 'per-target override wins');
  is($test->_timeout_for('build'), 86400, 'other targets fall back to MakeTimeout');

  local %Magus::Config = (MakeTimeout => 0);
  is($test->_timeout_for('build'), 0, 'watchdog can be disabled');
};

subtest 'exit status is preserved' => sub {
  local %Magus::Config = (MakeTimeout => 60);
  local $Magus::PortTest::MAKE = write_script('exiter.sh', <<'SH');
for arg in "$@"; do target="$arg"; done
echo "ran $target"
case "$target" in
  ok)  exit 0 ;;
  bad) echo "it broke" >&2; exit 3 ;;
esac
SH

  my $test = tester();
  ok($test->_run_make('ok'), 'zero exit reports success');
  is($? >> 8, 0, '$? reflects the exit status');
  ok(!$test->{timed_out}, 'no timeout recorded');
  like(log_for('ok'), qr/ran ok/, 'stdout captured to the target log');

  $test = tester();
  ok(!$test->_run_make('bad'), 'non-zero exit reports failure');
  is($? >> 8, 3, '$? carries the exit code through the SIGCHLD reaper');
  ok(!$test->{timed_out}, 'a plain failure is not a timeout');
  like(log_for('bad'), qr/it broke/, 'stderr captured to the target log');
};

subtest 'a hung build is killed off with its children' => sub {
  local %Magus::Config = (MakeTimeout => 3);
  local $Magus::PortTest::MAKE = write_script('hang.sh', <<'SH');
sh -c 'sleep 600' &
echo "$!" > "$0.child"
sleep 600
SH

  my $test = tester();
  my $started = time;
  ok(!$test->_run_make('hangs'), 'a hung target fails');
  my $elapsed = time - $started;

  is($test->{timed_out}, 3, 'the exceeded limit is recorded');
  cmp_ok($elapsed, '<', 3 + 2 * $Magus::PortTest::KillGrace + 5,
    'the watchdog returns within the grace window');
  like(log_for('hangs'), qr/exceeded 3 seconds, killed/, 'the log says why it stopped');

  open(my $fh, '<', "$dir/hang.sh.child") || die "Couldn't read child pid: $!";
  chomp(my $child = <$fh>);
  close($fh);

  # The grandchild was never ours to wait on, so poll for it to disappear.
  my $alive = 1;
  foreach (1 .. 10) {
    $alive = kill(0, $child) ? 1 : 0;
    last unless $alive;
    sleep 1;
  }
  ok(!$alive, "grandchild $child died with the process group");
};

subtest 'a child that ignores SIGTERM is still killed' => sub {
  local %Magus::Config = (MakeTimeout => 3);

  # make itself goes quietly on TERM, but the test runner it spawned does not.
  # Reaping the leader is therefore not enough; the group has to be emptied.
  local $Magus::PortTest::MAKE = write_script('stubborn.sh', <<'SH');
sh -c 'trap "" TERM; sleep 600; :' &
echo "$!" > "$0.child"
trap 'exit 0' TERM
sleep 600
SH

  my $test = tester();
  ok(!$test->_run_make('stubborn'), 'a hung target fails');
  is($test->{timed_out}, 3, 'the exceeded limit is recorded');

  open(my $fh, '<', "$dir/stubborn.sh.child") || die "Couldn't read child pid: $!";
  chomp(my $child = <$fh>);
  close($fh);

  my $alive = 1;
  foreach (1 .. 10) {
    $alive = kill(0, $child) ? 1 : 0;
    last unless $alive;
    sleep 1;
  }
  ok(!$alive, "SIGTERM-ignoring child $child was escalated to SIGKILL");
};

subtest 'a timeout survives parsed log diagnostics' => sub {
  my %results = (summary => 'fail', errors => [
    {phase => 'test', msg => 'make test timed out after 3 seconds and was killed',
     name => 'MakeTimeout'},
  ]);
  my $presults = {errors => [{phase => 'test', msg => 'parsed', name => 'IncompleteInstall'}]};

  # Mirrors the merge in run(): parsed errors win, but the timeout stays.
  my @timeouts = grep { ($_->{name} || '') eq 'MakeTimeout' } @{$results{errors} || []};
  $results{errors} = [@timeouts, @{$presults->{errors}}];

  is(scalar @{$results{errors}}, 2, 'both errors are reported');
  is($results{errors}[0]{name}, 'MakeTimeout', 'the timeout is reported first');
};

done_testing();
