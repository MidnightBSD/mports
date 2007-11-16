package Magus::Snap;
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
# $MidnightBSD: mports/Tools/lib/Magus/Log.pm,v 1.2 2007/10/24 00:27:03 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;
use base qw(Magus::DBI);


__PACKAGE__->table('snaps');
__PACKAGE__->columns(Essential => qw/id created/);

__PACKAGE__->set_sql(latest_snaps => 'SELECT __ESSENTIAL__ FROM __TABLE__ ORDER BY id DESC');


sub latest {
  my ($class) = @_;
  
  return $class->search_latest_snaps->next;
}  

sub tarball {
  my ($self) = @_;
  my $id = $self->id;
  
  return "$Magus::Config{MasterDataDir}/$Magus::Config{MportsSnapDir}/$id.tar.bz2"
}


1;
__END__

