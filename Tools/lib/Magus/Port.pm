package Magus::Port;
#
# $MidnightBSD: mports/Tools/lib/Mport/Port.pm,v 1.2 2007/09/11 02:32:03 ctriv Exp $
#
use strict;
use warnings;

use base 'Magus::DBI';

__PACKAGE__->table('ports');
__PACKAGE__->columns(Essential => qw(name version license pkgname));
__PACKAGE__->columns(All       => qw(description));
__PACKAGE__->has_many(depends => [ 'Magus::Depend' => 'dependency' ] => 'port');
__PACKAGE__->has_many(results => 'Magus::Result');

__PACKAGE__->set_sql(ready_ports => <<END_OF_SQL);
SELECT ports.* FROM ports 
WHERE 
    (name NOT IN (SELECT port FROM locks WHERE arch=?)) 
  AND 
    (name NOT IN (SELECT port FROM results WHERE arch=? AND version=ports.version)) 
  AND 
    (
      (name NOT IN (SELECT port FROM depends)) 
      OR 
      (name NOT IN (SELECT port FROM depends WHERE dependency NOT IN (SELECT port FROM results WHERE arch=? AND (summary="pass" OR summary="warn"))))
    )
END_OF_SQL

sub get_ready_port {
  my $arch = $Magus::Machine->arch;
  
  return shift->search_ready_ports(($Magus::Machine->arch) x 3)->next;
}
  

sub origin {
  return join('/', $Mport::Globals::ROOT, $_[0]->name);
}

sub current_result {
  my ($self) = @_;
  return $self->results(arch => $Magus::Machine->arch, version => $self->version)->next;
}


1;
__END__
