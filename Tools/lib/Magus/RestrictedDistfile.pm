package Magus::RestrictedDistfile;

use strict;
use warnings;
use base qw(Magus::DBI);

__PACKAGE__->table('restricted_distfiles');
__PACKAGE__->columns(All => qw/id port filename/);
__PACKAGE__->has_a(port => 'Magus::Port');

__PACKAGE__->set_sql(by_run_and_machine => <<END_OF_SQL);
SELECT restricted_distfiles.* FROM restricted_distfiles,ports
WHERE restricted_distfiles.port=ports.id AND run=? AND machine=? ORDER BY time DESC
END_OF_SQL

1;
__END__
