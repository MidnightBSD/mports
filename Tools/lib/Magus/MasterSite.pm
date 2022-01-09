package Magus::MasterSite;

use strict;
use warnings;
use base qw(Magus::DBI);

__PACKAGE__->table('master_sites');
__PACKAGE__->columns(All => qw/id port url/);
__PACKAGE__->has_a(port => 'Magus::Port');

__PACKAGE__->set_sql(by_run_and_machine => <<END_OF_SQL);
SELECT master_sites.* FROM master_sites,ports
WHERE master_sites.port=ports.id AND run=? AND machine=? ORDER BY time DESC
END_OF_SQL

1;
__END__

