#!/usr/local/bin/perl
#
# Copyright (c) 2007 Chris Reinhardt. All rights reserved.
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
# $MidnightBSD: mports/Tools/lib/Magus/PortTest.pm,v 1.2 2007/10/20 22:32:39 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



#
# todo: wrap run_test in eval: make an exception an internal error result.
#	docs
#	logging
#	setproctitle
#	

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

$SIG{INT} = sub { die "Caught SIGINT\n" };

main(@ARGV);

sub main {
  my $lock;
    
  while (1) {
    $lock = Magus::Lock->get_ready_lock();
    
    if (!$lock) {
      # there's no more ports to test, sleep for a while and check again.
      sleep($Magus::Config{'DoneWaitPeriod'});
      next;
    }
    
    run_test($lock);
    $lock->delete;
  }
}


END {
  Magus::Lock->search(machine => $Magus::Machine)->delete_all;
}


sub install_depends {
  my ($lock, $chroot) = @_;
  
  foreach my $depend ($lock->port->depends) {
    print "\tDep $depend\n";
    if (!$depend->current_result || $depend->current_result->summary eq 'pass' || $depend->current_result->summary eq 'warn') {
      # There should be a package that we can use to install the port.
      install_package($depend, $chroot) || last;
      next;
    }
    
    # We got a port that was scheduled ready, but wasn't!
    my $result = $lock->port->add_to_results({
      version => $lock->port->version,
      machine => $Magus::Machine,
      summary => 'fail',
      arch    => $Magus::Machine->arch,
    });
    
    $result->add_to_subresults({
      type   => 'prebuild',
      name   => 'SchedulerFailure',
      msg    => 'Port was scheduled as ready to build, but a dependancy had not been built successfuly.'
    });
    
    return 0;
  }
  
  return 1;
}
    
    
      
sub install_package {
  my ($port, $chroot) = @_;
  
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $arch = $Magus::Machine->arch;
  my $dest = join('/', $chroot->root, $chroot->packages, 'All');
  
  system("/usr/bin/scp $Magus::Config{'PkgfilesRoot'}/$arch/$file $dest"); 
}  
  
sub upload_package {
  my ($port, $chroot) = @_;

  my $arch = $Magus::Machine->arch;
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
          
  system("/usr/bin/scp $from $Magus::Config{'PkgfilesRoot'}/$arch/$file");
}  

  
sub run_test {
  my ($lock) = @_;
  
  my $port = $lock->port;
  
  my $chroot = Magus::Chroot->new(tarball => $Magus::Config{ChrootTarBall});

  install_depends($lock, $chroot);
  
  # we fork so just the child chroots, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish.
    waitpid($pid, 0);
  } elsif (defined $pid) {
    # Child, chroot and go.
    $chroot->do_chroot();
    chdir($port->origin);
    
    my $test    = Magus::PortTest->new(port => $port, chroot => $chroot);
    my $results = $test->run;
  
    insert_results($port, $results);
    
    exit(0);
  } else {
    die "Could not fork: $!\n";
  } 

  # Back to the parent here. 
  if ($? == 0) {
    my $result = $port->current_result;

    if ($result->summary eq 'pass' || $result->summary eq 'warn') {
      upload_package($port, $chroot);
    }

    return 1;
  } else {
    die "Child exited unexpectantly: $?\n";
  }
}


sub insert_results {
  my ($port, $results) = @_;
  
  my $res = $port->add_to_results({
    version => $port->version,
    summary => $results->{'summary'},
    machine => $Magus::Machine,
    arch    => $Magus::Machine->arch,
  });
  
  foreach my $sr (@{$results->{'warnings'}}) {
    $res->add_to_subresults({
      type => 'warning',
      %$sr
    });
  }
  
  foreach my $sr (@{$results->{'errors'}}) {
    $res->add_to_subresults({
      type => 'error',
      %$sr
    });
  }
}
      

1;
__END__

