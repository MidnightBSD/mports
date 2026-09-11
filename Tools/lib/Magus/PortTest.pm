package Magus::PortTest;
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

#
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;

use File::Path qw(mkpath);
use POSIX qw(setsid :sys_wait_h);

use Mport::Globals qw($MAKE);
use Mport::Utils   qw(make_var);

use Magus::OutcomeRules ();

# Seconds to wait for a killed build to go away before escalating TERM to KILL.
our $KillGrace = 10;

=head1 NAME 

Magus::PortTest

=head1 SYNOPSIS

  
=head1 DESCRIPTION

This class handles the actual testing of a single port.  It does not attempt
to install depends, or setup the chroot.  It simply runs a port, and
interpretes the results.

B<This class expects the chroot dir to be /.  Always chroot before using this
class.>

=head1 METHODS

=head2 Magus::PortTest->new(port => $port, chroot => $chroot)

Creates a new tester object.  

=cut

sub new {
  my ($class, %args) = @_;

  my $self = bless {
    %args,
    uid => "$args{port}:" . time,
  }, $class;

  $self->{logdir} = join('/', $self->{chroot}->logs, $self->{uid});
  mkpath($self->{logdir}) || die "Couldn't mkdir $self->{logdir}: $!\n";
  
  return $self;
}

=head2 my $results = $test->run

Runs the test and returns a data structure representing the results.

$results = {
  summary => 'fail',
  errors  => [
    {
      phase => 'fake',
      msg   => 'make fake returned non-zero: 1',
      name  => 'MakeExitNonZero',
    },
    {
      phase => 'fake',
      msg   => 'A file was installed in the final dir instead of the fake dir.',
      name  => 'FakedOutsideDestdir',
    }
  ],
  warnings => [
    {
      phase => 'patch',
      msg   => 'LICENSE is not set.',
      name  => 'NoLicense',
    }
  ],
};     

=cut

sub run {
  my ($self, $phase) = @_;
  $phase ||= 'build';
  
  $self->_set_env;
 
  my %results = (summary => 'pass');
  
  $self->check_for_skip(\%results) && return \%results;
  $self->check_for_test_skip(\%results) && return \%results if $phase eq 'test';
  $self->check_master_sites(\%results) if $phase eq 'build';

  foreach my $target ($self->targets_for_phase($phase)) {
    if (!$self->_run_make($target)) {
      if (my $limit = $self->{timed_out}) {
        push(@{$results{errors}}, {
          phase => $target,
          msg   => "make $target timed out after $limit seconds and was killed",
          name  => "MakeTimeout",
        });
      } else {
        my $error_code = $? >> 8;
        push(@{$results{errors}}, {
          phase => $target,
          msg   => "make $target returned non-zero: $error_code",
          name  => "MakeExitNonZero",
        });
      }

      $results{summary} = 'fail';
    }
    
    my $log;
    {
      local $/;
      open(my $fh, '<', "$self->{logdir}/$target") || die "Couldn't open $self->{logdir}/$target: $!\n";
      $log = <$fh>;
      close($fh) || die "Couldn't close $self->{logdir}/$target: $!\n";
    }
    
    my $testclass = "Magus::OutcomeRules::$target";
    
    my $presults = $testclass->execute(\$log);
    
    # update the summary if the phase results is worse than what we had.
    if ($results{summary} eq 'pass' || ($results{summary} eq 'warn' && $presults->{'summary'} ne 'pass')) {
      $results{summary} = $presults->{summary};
    } 
        
    if ($presults->{errors}) {
      # these will be the first errors we see.  If we parsed them, we just
      # report the results of parsing.  
      $results{errors} = $presults->{errors};
    }
    
    if ($presults->{warnings}) {
      push(@{$results{warnings}}, @{$presults->{warnings}});
    }
    
    if ($results{summary} eq 'fail') {
      $results{log} = {
        phase => $target,
        data  => $log,
      };
      last;
    }
  }
  
  return \%results;
}

sub targets_for_phase {
  my ($self, $phase) = @_;

  return qw(fetch) if $phase eq 'fetch';
  return qw(fetch extract patch configure build fake package) if $phase eq 'build';
  return qw(test) if $phase eq 'test';

  die "Unknown Magus phase: $phase\n";
}


sub check_for_skip {
  my ($self, $results) = @_;
  my $flavor =  $self->{port}->flavor;
  
  chdir($self->{port}->origin) || die "Couldn't chdir to " . $self->{port}->origin . ": $!\n";
  
  my $ignore = length $flavor ? `$MAKE -V IGNORE FLAVOR=$flavor` : make_var('IGNORE');
  chomp($ignore);
  
  if ($ignore) {
    $results->{skips} = [{
      phase => 'prerun',
      msg   => "$self->{port} $ignore",
      name  => 'PortIgnored',
    }];
    
    $results->{'summary'} = 'skip';
    
    return 1;
  }
  
  return;
}    

sub check_for_test_skip {
  my ($self, $results) = @_;
  my $flavor = $self->{port}->flavor;

  chdir($self->{port}->origin) || die "Couldn't chdir to " . $self->{port}->origin . ": $!\n";

  my $no_test = length $flavor ? `$MAKE -V NO_TEST FLAVOR=$flavor` : make_var('NO_TEST');
  my $testing_unsafe = length $flavor ? `$MAKE -V TESTING_UNSAFE FLAVOR=$flavor` : make_var('TESTING_UNSAFE');
  chomp($no_test, $testing_unsafe);

  return unless $no_test || $testing_unsafe;

  my $reason = $no_test ? 'NO_TEST is set' : "TESTING_UNSAFE is set: $testing_unsafe";
  $results->{skips} = [{
    phase => 'prerun',
    msg   => "$self->{port} test phase skipped: $reason",
    name  => 'TestSkipped',
  }];

  $results->{summary} = 'skip';

  return 1;
}

sub check_master_sites {
  my ($self, $results) = @_;
  my %seen;
  my @insecure = grep { !$seen{$_}++ }
                 grep { m{^(?:http|ftp)://}i }
                 map  { $_->url } $self->{port}->master_sites;

  return unless @insecure;

  my @shown = @insecure > 5 ? @insecure[0..4] : @insecure;
  my $extra = @insecure > @shown ? sprintf(" and %d more", scalar(@insecure) - scalar(@shown)) : "";

  push(@{$results->{warnings}}, {
    phase => 'prerun',
    msg   => "MASTER_SITES contains non-HTTPS URLs: " . join(", ", @shown) . $extra,
    name  => 'InsecureMasterSites',
  });

  $results->{summary} = 'warn' if $results->{summary} eq 'pass';
}


=head2 $test->_timeout_for($target)

The wall clock limit, in seconds, for a single make target.  C<MakeTimeouts>
gives per target overrides, C<MakeTimeout> the fallback.  Zero disables the
watchdog.

=cut

sub _timeout_for {
  my ($self, $target) = @_;

  my $timeouts = $Magus::Config{MakeTimeouts};

  if (ref $timeouts eq 'HASH' && defined $timeouts->{$target}) {
    return $timeouts->{$target};
  }

  return $Magus::Config{MakeTimeout} || 0;
}


=head2 $test->_run_make($target)

Runs a single make target, logging to F<$logdir/$target>.  The make runs in its
own session so that a port which hangs -- a test suite deadlocked on a pipe, a
configure script waiting on stdin -- can be killed off along with everything it
spawned instead of wedging this worker forever.

Returns true when make exited zero.  On a timeout C<$self->{timed_out}> is set
to the limit that was exceeded.

=cut

sub _run_make {
  my ($self, $target) = @_;

  my $flavor  = $self->{port}->flavor;
  my $logfile = "$self->{logdir}/$target";

  delete $self->{timed_out};

  chdir($self->{port}->origin) || die "Couldn't chdir to " . $self->{port}->origin . ": $!\n";

  my @cmd = ($MAKE, 'LANG=C.UTF-8', 'LC_ALL=C.UTF-8', $target);
  push(@cmd, "FLAVOR=$flavor") if length $flavor;

  my $timeout = $self->_timeout_for($target);

  # magus.pl installs a SIGCHLD handler that reaps indiscriminately; keep it
  # away from our waitpid so we actually see make's exit status.
  local $SIG{CHLD} = 'DEFAULT';

  my $pid = fork;
  die "Couldn't fork for make $target: $!\n" unless defined $pid;

  unless ($pid) {
    # Lead our own process group so the watchdog can signal the whole build.
    POSIX::setsid();
    open(STDOUT, '>', $logfile)  || exit 127;
    open(STDERR, '>&', \*STDOUT) || exit 127;
    exec(@cmd);
    exit 127;
  }

  my $status;
  my $timed_out = 0;

  eval {
    local $SIG{ALRM} = sub { $timed_out = 1; die "make timeout\n" };
    alarm($timeout) if $timeout;
    waitpid($pid, 0);
    $status = $?;
    alarm(0);
    1;
  };

  alarm(0);

  if ($timed_out) {
    $self->{timed_out} = $timeout;
    $self->_reap_group($pid);

    if (open(my $fh, '>>', $logfile)) {
      print $fh "\n*** magus: make $target exceeded $timeout seconds, killed ***\n";
      close($fh);
    }

    $? = -1;
    return 0;
  }

  die $@ if $@;

  $? = defined($status) ? $status : -1;

  return defined($status) && $status == 0;
}


=head2 $test->_reap_group($pid)

Terminate the process group led by $pid, escalating to SIGKILL if it does not
go away, and wait for the leader so we do not leave a zombie behind.

=cut

sub _reap_group {
  my ($self, $pid) = @_;

  foreach my $signal (qw(TERM KILL)) {
    kill($signal, -$pid) || kill($signal, $pid);

    foreach (1 .. $KillGrace) {
      return if waitpid($pid, WNOHANG) > 0;
      sleep 1;
    }
  }

  waitpid($pid, WNOHANG);
}




sub _set_env {
  my ($self) = @_;
  
  $ENV{PACKAGES}       		= $self->{chroot}->packages;
  $ENV{WRKDIRPREFIX}  		= $self->{chroot}->workdir;
  $ENV{DEPENDS_TARGET} 		= 'magus-install-depend';
  $ENV{DISTDIR}        		= $self->{chroot}->distfiles;
  $ENV{LANG}           		= 'C.UTF-8';
  $ENV{LC_ALL}         		= 'C.UTF-8';
  $ENV{MAGUS}          		= 1;
  $ENV{BATCH}	       		= 1;
  $ENV{MPORT_MAINTAINER_MODE} 	= 1;
  $ENV{PACKAGE_BUILDING}	= 1;
  $ENV{TRYBROKEN}		= 1;
}


1;
__END__
