package Magus::DBI;
#
# Copyright (c) 2014 Lucas Holt
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
use base 'Class::DBI';


__PACKAGE__->connection(
  "dbi:Pg:dbname=$Magus::Config{DBName};host=$Magus::Config{DBHost};", 
  $Magus::Config{DBUser},
  $Magus::Config{DBPass},
  {AutoCommit => 1, RaiseError => 1, PrintError => 0}
);


=head2 Magus::DBI->ping

Return true if we can connect to the database, false otherwise.

=cut

sub ping {
  my ($class) = @_;
  my $ret = 0;
    
  eval {
    my $dbh = $class->db_Main();
    
    $ret = $dbh->ping;
  };
  
  return $ret;  
}
    


=head2 $obj->refresh

Get new values for the columns from the database.

=cut

sub refresh {
  my ($self) = @_;
  
  my %pk = map { $_ => 1 } $self->primary_columns;
  
  $self->_attribute_delete(grep { !$pk{$_} } $self->all_columns);
  
  return $self;
}


1;
__END__
