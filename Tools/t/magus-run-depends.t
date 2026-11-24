use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use Test::More;

use Magus::PortTest;
use Magus::OutcomeRules;

my $test = bless {}, 'Magus::PortTest';

subtest 'build phase installs run dependencies before fake' => sub {
  my @targets = $test->targets_for_phase('build');
  my %at;
  @at{@targets} = (0 .. $#targets);

  ok(exists $at{'run-depends'}, 'run-depends is a build target');
  ok($at{'run-depends'} > $at{build}, 'after build');
  ok($at{'run-depends'} < $at{fake}, 'before fake');
  is_deeply([$test->targets_for_phase('fetch')], ['fetch'], 'fetch phase unchanged');
  is_deeply([$test->targets_for_phase('test')], ['test'], 'test phase unchanged');
};

subtest 'every target has an outcome rules class' => sub {
  foreach my $phase (qw(fetch build test)) {
    foreach my $target ($test->targets_for_phase($phase)) {
      my $class = $test->rules_class_for($target);
      ok($class->can('execute'), "$target -> $class");
    }
  }
  is($test->rules_class_for('run-depends'), 'Magus::OutcomeRules::run_depends',
     'dash maps to underscore');
};

subtest 'run-depends rules' => sub {
  my $class = $test->rules_class_for('run-depends');

  my $log = "===>   foo-1.0 depends on package: bar>=1 - not found\n"
          . "Missing dependency package file: /packages/All/bar-1.0.mport\n"
          . "*** Error code 1\n";
  my $res = $class->execute(\$log);
  is($res->{summary}, 'fail', 'missing package fails');
  is($res->{errors}[0]{name}, 'MissingDependencyPackage', 'rule name');
  is($res->{errors}[0]{phase}, 'run-depends', 'phase matches the make target');
  like($res->{errors}[0]{msg}, qr{bar-1\.0\.mport}, 'names the package');

  my $ok = "===>   foo-1.0 depends on package: bar>=1 - found\n";
  is($class->execute(\$ok)->{summary}, 'pass', 'clean log passes');
};

subtest 'existing phase names are unchanged' => sub {
  my $log = "    /usr/local/bin/foo installed in /\n";
  my $res = Magus::OutcomeRules::fake->execute(\$log);
  is($res->{errors}[0]{phase}, 'fake', 'fake rules still report phase fake');
};

done_testing;
