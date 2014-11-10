package Magus::Index;
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
# $MidnightBSD: mports/Tools/lib/Magus/Index.pm,v 1.13 2008/10/02 21:13:56 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;

use Mport::Utils qw(make_var recurse_ports);
  
use YAML qw(Load);
 
sub sync {
  my ($class, $root, $run) = @_;
  my $arch = $run->arch;
  my %visited;
  
  $root ||= "$Magus::Config{MasterDataDir}/$Magus::Config{MportsVcsDir}";
  
  local $| = 1;
  
  my %depends;
  
  recurse_ports {
    print @_, "... ";
    
    my $yaml = `__MAKE_CONF=/dev/null INDEXING=1 ARCH=$arch PORTSDIR=$root BATCH=1 PACKAGE_BUILDING=1 MAGUS=1 make describe-yaml`;
    my %dump;
      
    eval {
      %dump = %{ Load($yaml) };
    };
      
    if ($@) {
      warn "Unable to parse yaml for $_[0]: $@\n";
      return;
    }
      
    my $port = Magus::Port->insert({ 
      run         => $run,
      name        => $dump{name}, 
      version     => $dump{version},
      description => $dump{description},
      license	  => join(" ", @{$dump{'license'}}),
      restricted  => $dump{restricted},
      www         => $dump{www},
      pkgname     => $dump{pkgname},
    });     

    # We only have one depend type, merge into a unique list
    my %portdepends;
    while (my ($type, $deps) = each %{$dump{'depends'}}) {
      foreach my $dep (@$deps) {
        $portdepends{$dep}++;
      }
    }
      
    $depends{$port->id} = [keys %portdepends];
      
    $class->sync_categories(\%dump, $port, $arch);
      
    if ($dump{is_interactive}) {
      print "\n\tIGNORE set.  Marking as skippped.";
      $port->set_result_skip("Port is marked as interactive.");
    }
    
    print "done.\n";
  } root    => $root, nochdir => sub { warn "ERROR: no such port $_[0]\n" };

  print "Building depends list... \n";
  
  PORT: while (my ($id, $depends) = each %depends) {
    my $port = Magus::Port->retrieve($id) || die "Got an invalid port in the depends list! ($id)";

    for (@$depends) {
      my $depend = Magus::Port->retrieve(run => $run, name => $_);
      
      if (!$depend) {
        warn "\tMissing depend for $port: $_\n";
        $port->set_result_fail(qq(depend "$_" does not exist.));
        next PORT;
      }
      
      $port->add_to_depends({ 
        dependency => $depend
      });    
    }    
  }
  
  print "done.\n";
}


sub sync_categories {
    my ($class, $dump, $port, $arch) = @_;
    
    Magus::PortCategory->search(port => $port)->delete_all;
    
    for (@{$dump->{'categories'}}) {
      my $cat = Magus::Category->find_or_create({ category => $_});
      $port->add_to_categories({ category => $cat });
    }
}
  
       

   
1;
__END__
 
