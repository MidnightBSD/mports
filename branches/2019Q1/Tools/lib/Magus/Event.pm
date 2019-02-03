package Magus::Event;
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
use base qw(Magus::DBI);

__PACKAGE__->table('events');
__PACKAGE__->columns(All => qw/id port phase type name msg machine time/);
__PACKAGE__->has_a(port => 'Magus::Port');
__PACKAGE__->has_a(machine => 'Magus::Machine');

__PACKAGE__->set_sql(by_run_and_machine => <<END_OF_SQL);
SELECT events.* FROM events,ports 
WHERE events.port=ports.id AND run=? AND machine=? ORDER BY time DESC
END_OF_SQL

=head2 types

 fail
 warn
 info
 internal
 skip
 
=cut



1;
__END__

