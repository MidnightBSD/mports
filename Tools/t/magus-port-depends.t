use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use Test::More;

use Magus::Port;

{
  package Magus::Port::TestPort;
  sub new { bless {name => $_[1]}, $_[0] }
  sub name { $_[0]->{name} }
}

{
  package Magus::Port::TestDepend;
  sub new { bless {dependency => $_[1], type => $_[2]}, $_[0] }
  sub dependency { $_[0]->{dependency} }
  sub type { $_[0]->{type} }
}

my $wheel = Magus::Port::TestPort->new('wheel');
my $pytest = Magus::Port::TestPort->new('pytest');
my $packaging = Magus::Port::TestPort->new('packaging');

my %relations = (
  wheel => [
    Magus::Port::TestDepend->new($packaging, 'run'),
    Magus::Port::TestDepend->new($pytest, 'test'),
  ],
  pytest => [Magus::Port::TestDepend->new($wheel, 'build')],
  packaging => [],
);

{
  no warnings 'redefine';
  local *Magus::Depend::search = sub {
    my ($class, %args) = @_;
    return @{$relations{$args{port}->name}};
  };

  my @build = Magus::Port::build_depends_closure($wheel);
  is_deeply([map { $_->name } @build], ['packaging'],
    'build closure excludes test dependencies and breaks the cycle');

  my @test = Magus::Port::test_depends_closure($wheel);
  is_deeply([sort map { $_->name } @test], [qw(packaging pytest)],
    'test closure includes direct test dependencies without reinjecting the port');
}

done_testing();
