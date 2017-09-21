package Magus::Run;
#
# Copyright (c) 2008 Chris Reinhardt. All rights reserved.
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
use base qw(Magus::DBI);


__PACKAGE__->table('runs');
__PACKAGE__->columns(Essential => qw/id osversion arch status created blessed/);

__PACKAGE__->has_many(ports => 'Magus::Port');

=head2 Magus::Run->latest($machine)

Takes a machine, and returns the latest active run for that machine's osversion and arch.

=cut

sub latest {
  my ($class, $machine) = @_;
  
  return $class->search(
    osversion => $machine->osversion,
    arch      => $machine->arch,
    status    => 'active',
    { order_by => 'id DESC' }
  )->next;
}


=head2 $run->is_empty();

Returns true if the run has no ports left to be tested

=cut

sub is_empty {
  my ($self) = @_;
  
  # if there is a locked port, then there may be new ports once this one is done.
  return 0 if Magus::Lock->search_by_run($self)->count;

  return Magus::Port->get_ready_port($self) ? 0 : 1;
}


=head2 $run->tarball

Returns the run's tarball filename (no path)

=cut

sub tarball {
  my ($self) = @_;
  my $id = $self->id;
  
  return "mports-tree-$id.tar.bz2"
}

=head2 $run->tarballpath

Returns the absolute path to the tarball (including scp information if you're
on a node).  This is implemented as:

 "$Magus::Config{MasterDataDir}/$Magus::Conig{MportsSnapDir}/" . $run->tarball

=cut

sub tarballpath {
  return "$Magus::Config{MasterDataDir}/$Magus::Config{MportsSnapDir}/" . shift->tarball;
}


1;
__END__

