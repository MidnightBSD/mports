package Mport::DBI;

use Mport::Globals qw($INDEX);

use base 'Class::DBI';
__PACKAGE__->connection("dbi:SQLite:$INDEX", '', '');

