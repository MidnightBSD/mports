package Magus::BuildJobs;

use strict;
use warnings;

# Keep this independent of Magus configuration/database initialization.
sub limit {
  my ($class, $workers, $override, $cpus) = @_;

  die "Worker count must be a positive integer\n"
    unless defined($workers) && $workers =~ /\A[1-9][0-9]*\z/;
  die "MakeJobsPerWorker must be zero (automatic) or a positive integer\n"
    if defined($override) && $override !~ /\A(?:0|[1-9][0-9]*)\z/;
  return $override if $override;

  die "CPU count must be a positive integer\n"
    unless defined($cpus) && $cpus =~ /\A[1-9][0-9]*\z/;
  my $jobs = int($cpus / $workers);
  return $jobs > 0 ? $jobs : 1;
}

sub cpu_count {
  # Detect on the host, before chroot; do not let the daemon's SIGCHLD
  # handler consume the status of sysctl.
  local $SIG{CHLD} = 'DEFAULT';
  open(my $fh, '-|', '/sbin/sysctl', '-n', 'hw.ncpu') or return;
  my $count = <$fh>;
  my $ok = close($fh);
  return unless $ok && defined($count);
  chomp($count);
  return $count if $count =~ /\A[1-9][0-9]*\z/;
  return;
}

1;
