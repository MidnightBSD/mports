package Mport::Index;
#
# $MidnightBSD$
#
use strict;
use warnings;

use Mport::Globals qw($ROOT $INDEX);
use Mport::Port ();
use Mport::Utils qw(make_var);
use YAML;

use Cwd;
use Fatal qw(chdir);
use DBI;

sub build {
  my ($class) = @_;
  
  my $cwd = $ROOT;
  my $dbh = create_db();
      
  chdir($cwd);

  recurse($cwd, $dbh);
}

sub recurse {  
  my ($cwd, $dbh) = @_;
  
  my @subdirs = make_var('SUBDIR');
  
  if (!@subdirs) {
    return process_port($cwd, $dbh);
  }
  
  foreach my $subdir (@subdirs) {
    $subdir = "$cwd/$subdir";
    eval { chdir($subdir); };
    next if $@;
    recurse($subdir, $dbh)
  }   
}

sub process_port {
  my ($cwd, $dbh) = @_;
  
  my $yaml = `make describe-yaml`;
  my %port;
  eval {
    %port = %{Load($yaml)};  
  };
  
  if ($@) {
    warn "Unable to parse yaml for $cwd\n";
    return;
  }

  local $dbh->{AutoCommit} = 0;
  
  eval {
    my $sth = $dbh->prepare("INSERT INTO mports (name, version, description, origin) VALUES (?,?,?,?)");
    $sth->execute(@port{qw(name version description origin)});
    $sth->finish;
  
    $sth = $dbh->prepare("INSERT INTO depends (port, type, dependency) VALUES (?,?,?)");
    foreach my $type (qw(lib run build patch extract fetch)) {
      foreach my $dep (@{$port{"${type}_depends"}}) {
        $sth->execute($port{'name'}, $type, $dep);
      }
    }
    $sth->finish;
    
    $dbh->commit;
  };
  
  if ($@) {
    warn "Unable to insert $port{'name'}: $@\n";
    eval { $dbh->rollback };
  }    
}

sub create_db {
  unlink($INDEX);
  my $dbh = DBI->connect("dbi:SQLite:dbname=$INDEX", "", "", { RaiseError => 1, PrintError => 0 });
  $dbh->do(<<END_O_SQL);
CREATE TABLE mports (
  name text primary key,
  version text,
  description text,
  origin text
)
END_O_SQL
  $dbh->do(<<END_O_SQL);
CREATE TABLE depends (
  port text, 
  type text,
  dependency text
);
END_O_SQL
  $dbh->do('CREATE INDEX mport_version_index ON mports (name, version)');
  $dbh->do('CREATE INDEX depends_port ON depends (port)');
  $dbh->do('CREATE INDEX depends_revese ON depends (dependency)');
  $dbh->do('CREATE INDEX depends_type ON depends (port, type)');
  
  return $dbh;
}
  
  
  
  

   
1;
__END__
 