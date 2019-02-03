package Mport::Index;
#
# $MidnightBSD: mports/Tools/lib/Mport/Index.pm,v 1.3 2007/10/19 04:35:58 ctriv Exp $
#
use strict;
use warnings;

use Mport::Globals qw($ROOT $INDEX);
use Mport::Utils qw(make_var recurse_ports);
use YAML;

use Cwd;
use Fatal qw(chdir);
use DBI;

sub build {
  my ($class) = @_;
  
  my $dbh = $class->create_db();
  
  my $categories_inserted;
  
  recurse_ports {  
    insert_categories($dbh) unless $categories_inserted++;
  
    my $yaml = `make describe-yaml`;
    my %port;
    eval {
      %port = %{Load($yaml)};  
    };
  
    if ($@) {
      warn "Unable to parse yaml for $_[0]: $@\n";
      return;
    }

    local $dbh->{AutoCommit} = 0;
  
    eval {
      my $sth = $dbh->prepare("INSERT INTO ports (name, version, description, pkgname, license) VALUES (?,?,?,?,?)");
      $sth->execute(@port{qw(name version description pkgname license)});
      $sth->finish;
  
      $class->insert_depends(\%port, $dbh);
  
      
      $sth = $dbh->prepare("INSERT INTO port_categories (port, category_id) VALUES (?, (SELECT id FROM categories WHERE category=?))");      
      foreach my $cat (@{$port{'categories'}}) {      
        $sth->execute($port{'name'}, $cat);
      }
      $sth->finish;
      
      $dbh->commit;
    };
  
    if ($@) {
      warn "Unable to insert $port{'name'} ($_[0]): $@\n";
      eval { $dbh->rollback };
    }    
  };
}


sub insert_depends {
  my ($class, $port, $dbh) = @_;
  
  my $sth = $dbh->prepare("INSERT INTO depends (port, type, dependency) VALUES (?,?,?)");
  while (my ($type, $deps) = each %{$port->{'depends'}}) {
    foreach my $dep (@$deps) {
      $sth->execute($port->{'name'}, $type, $dep);
      }
  }
  $sth->finish;
}


sub insert_categories {
  my ($dbh) = @_;
  
  my @categories = make_var("VALID_CATEGORIES");
  
  my $sth = $dbh->prepare("INSERT INTO categories (category) VALUES (?)");
  foreach my $cat (@categories) {
    $sth->execute($cat);
  }
  $sth->finish;
}
      

sub connect_db {
  my ($class) = @_;

  return DBI->connect("dbi:SQLite:dbname=$INDEX", "", "", { RaiseError => 1, PrintError => 0 });
}
  

sub create_db {
  my ($class) = @_;
  unlink($INDEX);

  my $dbh = $class->connect_db();
  $dbh->do(<<END_O_SQL);
CREATE TABLE ports (
  name text primary key,
  version text,
  description text,
  license text,
  pkgname text
)
END_O_SQL
  $dbh->do(<<END_O_SQL);
CREATE TABLE depends (
  port text, 
  type text,
  dependency text
);
END_O_SQL
  $dbh->do(<<END_O_SQL);
CREATE TABLE categories (
  id integer primary key autoincrement, 
  category text
);
END_O_SQL
  $dbh->do(<<END_O_SQL);
CREATE TABLE port_categories (
  port text, 
  category_id int
);
END_O_SQL

  $dbh->do('CREATE INDEX mport_version_index ON ports (name, version)');
  $dbh->do('CREATE INDEX depends_port ON depends (port)');
  $dbh->do('CREATE INDEX depends_revese ON depends (dependency)');
  $dbh->do('CREATE INDEX depends_type ON depends (port, type)');

  # XXX more indexes needed.
  
  
  return $dbh;
}
  
  
  
  

   
1;
__END__
 