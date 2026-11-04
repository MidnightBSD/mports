use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use File::Temp qw(tempdir);
use Test::More;
use POSIX qw(WNOHANG);
use Magus::BuildJobs;
use Magus::PortTest;

is(Magus::BuildJobs->limit(4, 0, 16), 4, 'CPU budget divided among workers');
is(Magus::BuildJobs->limit(3, 0, 16), 5, 'fractional shares round down');
is(Magus::BuildJobs->limit(8, 0, 2), 1, 'at least one job per worker');
is(Magus::BuildJobs->limit(1, undef, 16), 16, 'one worker can use all CPUs');
is(Magus::BuildJobs->limit(4, 2, undef), 2, 'override does not require CPU detection');
for my $bad (0, -1, 'two', '1.5', '') {
  ok(!eval { Magus::BuildJobs->limit($bad, 0, 16); 1 }, "reject worker count '$bad'");
}
for my $bad (-1, 'two', '1.5', '') {
  ok(!eval { Magus::BuildJobs->limit(4, $bad, 16); 1 }, "reject override '$bad'");
}

{
  package JobsMockPort;
  sub origin { $_[0]->{dir} }
  sub flavor { $_[0]->{flavor} || '' }
}

subtest 'BSD make receives the cap for build and deferred tests' => sub {
  my $make;
  for my $dir (split /:/, $ENV{PATH}) {
    $make = "$dir/bmake", last if -x "$dir/bmake";
  }
  $make = '/usr/bin/make' if !$make && $^O =~ /bsd/i;
  plan skip_all => 'BSD make not available' unless $make;

  my $dir = tempdir(CLEANUP => 1);
  mkdir "$dir/log" or die $!;
  open(my $fh, '>', "$dir/Makefile") or die $!;
  print {$fh} <<'MAKE';
.if ${FLAVOR:U} == "small"
MAKE_JOBS_NUMBER_LIMIT=2
.elif ${FLAVOR:U} == "large"
MAKE_JOBS_NUMBER_LIMIT=32
.elif ${FLAVOR:U} == "expression"
NODE_CAP=2
MAKE_JOBS_NUMBER_LIMIT=${NODE_CAP}
.endif
build test:
	@echo cap=${MAKE_JOBS_NUMBER_LIMIT:Uunset}
MAKE
  close($fh) or die $!;
  local $Magus::PortTest::MAKE = $make;
  local %Magus::Config = (MakeTimeout => 10);
  local $ENV{MAKE_JOBS_NUMBER_LIMIT};
  delete $ENV{MAKE_JOBS_NUMBER_LIMIT};
  local $SIG{CHLD} = sub { 1 while waitpid(-1, WNOHANG) > 0 };
  require Cwd;
  my $cwd = Cwd::getcwd();

  for my $case (['', 4], ['small', 2], ['large', 4], ['expression', 2]) {
    my ($flavor, $expected) = @$case;
    my $tester = bless {
      port => bless({dir => $dir, flavor => $flavor}, 'JobsMockPort'),
      logdir => "$dir/log", make_jobs_limit => 4,
    }, 'Magus::PortTest';
    my %results;
    $tester->check_for_skip(\%results);
    for my $target (qw(build test)) {
      ok($tester->_run_make($target), "$target succeeds for flavor '$flavor'");
      open(my $log, '<', "$dir/log/$target") or die $!;
      local $/;
      like(<$log>, qr/^cap=$expected$/m, "$target respects effective cap $expected");
      close($log);
    }
  }
  chdir($cwd) or die $!;
};

done_testing();
