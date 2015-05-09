#!/usr/bin/perl
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
use lib qw(/usr/mports/Tools/lib);


use Magus;
use Mport::Utils qw(recurse_ports);
use File::Path qw(rmtree);
use File::Copy qw(move);

my $op = shift || die "Usage: $0 refresh | new <arch> <osversion>\n";

if ($op eq 'refresh') {
  refresh_completed_runs();
} elsif ($op eq 'new') {
  insert_new_run();
} else {
  die "Usage: $0 refresh | new <arch> <osversion>\n";
}


sub insert_new_run {
  my ($arch, $osversion) = @ARGV;
  
  unless ($arch && $osversion) {
    die "Usage: $0 new <arch> <osversion>\n";
  }
  
  update_vcs_dir();

  my $run = Magus::Run->create({osversion => $osversion, arch => $arch});
  
  make_tarball($run);
  Magus::Index->sync("$Magus::Config{MasterDataDir}/$Magus::Config{MportsVcsDir}", $run);
  
  $run->status('active');
  $run->update;
}



# The basic outline of the update is this:
# 1) Check to see if any runs are finished, if they are marked them as complete.  If no runs
#    are done we exit, because there is nothing to do.
# 2) Update the MportsVcs dir.
# 3) Make a new MportsTarball from 2)
# 3) create a new run.
# 4) index the tree and create port entries for the new runs.
# 5) mark the new runs as active.
sub refresh_completed_runs {
  my @completed;
  
  if (@completed = find_empty_runs()) {
    for (@completed) {
      $_->status('complete');
      $_->update;
    }
  } else {
    return;
  }
    
  update_vcs_dir();
  
  foreach my $done (@completed) {
    printf "refreshing %s on %s\n", $done->osversion, $done->arch;
    my $run = Magus::Run->create({osversion => $done->osversion, arch => $done->arch});
    make_tarball($run);

    Magus::Index->sync("$Magus::Config{MasterDataDir}/$Magus::Config{MportsVcsDir}", $run);
    
    $run->status('active');
    $run->update;
  }  
}


sub update_vcs_dir {
  chdir($Magus::Config{'MasterDataDir'})  || die "Couldn't cd to $Magus::Config{'MasterDataDir'}: $!\n";

  # let the magus group read and write.
  umask(0002);  

  print "Deleteing $Magus::Config{MportsVcsDir}...";
  if (-d $Magus::Config{MportsVcsDir}) {
    rmtree($Magus::Config{MportsVcsDir})    || die "Couldn't rmtree $Magus::Config{'MportsVcsDir'}: $!\n";
  }
  
  print " done.\n";
  
  my $cmd = "svn co $Magus::Config{VcsRoot}/mports/trunk $Magus::Config{MportsVcsDir}";
  system($cmd) == 0 || die "$cmd returned non-zero: $?\n";
}


sub make_tarball {
  my ($run) = @_;
  
  mkdir("$Magus::Config{PkgfilesRoot}/" . $run->id) || ($! =~ m/exist/ || die "Couldn't make package dir for $run\n");
  
  my $tarball = $run->tarball;

  set_tree_id("$Magus::Config{'MasterDataDir'}/$Magus::Config{'MportsVcsDir'}", $run);
  
  chdir($Magus::Config{'MasterDataDir'})  || die "Couldn't cd to $Magus::Config{'MasterDataDir'}: $!\n";
  unlink($tarball) || ($! !~ m/no such/i && die "Couldn't unlink $tarball: $!\n");
  
  my $tar = "/usr/bin/tar cfj $tarball $Magus::Config{MportsVcsDir}";
  
  system($tar) == 0 || die "$tar returned non-zero: $?\n";
  move($tarball, $Magus::Config{'RunTarballDir'}) || die "Couldn't mv $tarball $Magus::Config{'RunTarballDir'}: $!\n";
  chmod(0664, "$Magus::Config{'RunTarballDir'}/$tarball") || die "Couldn't chmod Magus::Config{'RunTarballDir'}/$tarball: $!\n";
}


sub find_empty_runs {
  my @runs = grep { $_->is_empty } Magus::Run->search(status => 'active');
}


sub set_tree_id {
  my ($root, $run) = @_;
  my $file = "$root/.magus_run_id";

  open(ID, '>', $file) || die "Couldn't open $file: $!\n";
  print ID $run->id, "\n";
  close(ID) || die "Couldn't close $file: $!\n";
}



