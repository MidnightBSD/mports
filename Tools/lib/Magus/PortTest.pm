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
# $MidnightBSD$
#
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;

use File::Path qw(mkpath);

use Mport::Globals qw($MAKE);
use Mport::Utils   qw(make_var);

use Magus::OutcomeRules ();

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
  my ($self) = @_;
  
  $self->_set_env;
  $self->{chroot}->mark_dirty;
 
  my %results = (summary => 'pass');
  
  $self->check_for_skip(\%results) && return \%results;

  
  foreach my $target (qw(fetch extract patch configure build fake package install deinstall reinstall)) {
    if (!$self->_run_make($target)) {
      my $error_code = $? >> 8;
      push(@{$results{errors}}, {
        phase => $target,
        msg   => "make $target returned non-zero: $error_code",
        name  => "MakeExitNonZero",
      });
      
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
    
    my $presults = $testclass->test(\$log);
    
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


sub check_for_skip {
  my ($self, $results) = @_;
  
  chdir($self->{port}->origin) || die "Couldn't chdir to " . $self->{port}->origin . ": $!\n";
  
  chomp(my $ignore = make_var('IGNORE'));
  
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


sub _run_make {
  my ($self, $target) = @_;

  my $flavor =  $self->{port}->{flavor};

  chdir($self->{port}->origin) || die "Couldn't chdir to " . $self->{port}->origin . ": $!\n";

  if (length $flavor) {
    return system("$MAKE $target >$self->{logdir}/$target FLAVOR=$flavor 2>&1") == 0;
  } else {
    return system("$MAKE $target >$self->{logdir}/$target 2>&1") == 0;
  }
}  




sub _set_env {
  my ($self) = @_;
  
  $ENV{PACKAGES}       		= $self->{chroot}->packages;
  $ENV{WRKDIRPREFIX}  		= $self->{chroot}->workdir;
  $ENV{DEPENDS_TARGET} 		= 'magus-install-depend';
  $ENV{DISTDIR}        		= $self->{chroot}->distfiles;
  $ENV{MAGUS}          		= 1;
  $ENV{BATCH}	       		= 1;
  $ENV{MPORT_MAINTAINER_MODE} 	= 1;
  $ENV{PACKAGE_BUILDING}	= 1;
  $ENV{TRYBROKEN}		= 1;
}


1;
__END__



