#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;
use CGI;
use HTML::Template;
use JSON::XS;

eval {
  main();
};

error($@) if $@;

sub main {
  my $p = CGI->new;
  
  my $path = $p->path_info;

  if ($path eq '' || $path eq '/') {
    summary_page($p);
  } elsif ($path =~ m:/list/(.*):) {
    list_page($p, $1);
  } elsif ($path =~ m:/ports/(.*):) {
    port_page($p, $1);
  } elsif ($path =~ m:/results/async/(\d+):) {
    result_details_async($p, $1);
  } elsif ($path =~ m:/search:) {
    return search($p);
  } else {
    die "Unknown path: $path\n";
  }
}

sub summary_page {
  my ($p) = @_;
  
  Magus::Result->set_sql(last_twenty => qq{
      SELECT __ESSENTIAL__
      FROM __TABLE__
      ORDER BY id DESC LIMIT 20
  });
  
  my @results = map {{
    summary => $_->summary,
    port    => $_->port,
    version => $_->version,
    machine => $_->machine->name,
    arch    => $_->arch 
  }} Magus::Result->search_last_twenty;
  
  print $p->header;
  
  my $tmpl = template($p, 'index.tmpl');
  
  $tmpl->param(
    title     => 'Magus Summary', 
    results   => \@results
  );
  
  my @locks = map {{
    port    => $_->port->name,
    machine => $_->machine->name,
    arch    => $_->arch
  }} Magus::Lock->retrieve_all;
  
  $tmpl->param(
    locks => \@locks
  ); 
  print $tmpl->output;
}

sub port_page {
  my ($p, $port) = @_;
  
  my $tmpl = template($p, "port.tmpl");
  
  $port = Magus::Port->retrieve($port) || die "No such port: $port";
  
  $tmpl->param(
    port => $port->name, 
    title => "Magus // $port",
    desc  => $port->description,
  );
  
  my @results = map { {
    id	    => $_->id,
    version => $_->version,
    machine => $_->machine->name,
    arch    => $_->arch,
    summary => $_->summary,
    has_details => ($_->summary eq 'pass') ? 0 : 1,
  }} sort { $b->id <=> $a->id } $port->results;
  
  if (@results) {
    $tmpl->param(
      results => \@results,
    );
  }
  
  my @depends = map { {
    port => $_->name
  } } $port->depends;

  if (@depends) {
    $tmpl->param(depends => \@depends);
  }
  
  my @depends_of = map { {
    port => $_->port
  } } Magus::Depend->search(dependency => $port);
  
  if (@depends_of) {
    $tmpl->param(depends_of => \@depends_of);
  }
  
  print $p->header, $tmpl->output;
}

sub result_details_async {
  my ($p, $id) = @_;
  
  my %details = (id => $id);
  
  my $result = Magus::Result->retrieve($id) || die "No such results: $id";
  
  my @subresults = map { {
	phase => $_->phase,
	type  => $_->type,
	name  => $_->name,
	msg   => $_->msg,
  } } $result->subresults;

  if (@subresults) {
    $details{subresults} = \@subresults;
  }
  
  my $log = $result->logs->next;
  
  if ($log) {
    $details{log} = $log->data;
  }

  print $p->header(-type => 'text/plain'), to_json(\%details);
}

sub list_page {
  my ($p, $summary) = @_;
  
  Magus::Result->set_sql(current_results => "SELECT results.* FROM results JOIN ports ON results.port=ports.name AND results.version=ports.version WHERE summary=? ORDER BY id DESC");  

  my @results = map {{
    summary => $_->summary,
    port    => $_->port,
    version => $_->version,
    machine => $_->machine->name,
    arch    => $_->arch, 
    id      => $_->id,
    has_details => ($_->summary eq 'pass') ? 0 : 1,
  }} Magus::Result->search_current_results($summary);
  
  my $tmpl = template($p, 'list.tmpl');
  
  my %titles = (
    fail => 'Failed Ports',
    skip => 'Skipped Ports',
    pass => 'Passed Ports',
    internal => 'Internal failures',
    warn     => 'Warned Ports',
  );
  
  $tmpl->param(results => \@results, title => $titles{$summary}, count => scalar @results);

  print $p->header, $tmpl->output;
}


sub search {
  my ($p) = @_;
  
  my $query = $p->param('q');
  
  my @ports = Magus::Port->retrieve_from_sql("name LIKE ?", "%$query%");
  
  if (@ports == 1) {
    print $p->redirect("http://cs.emich.edu/magus/index.cgi/ports/$ports[0]");
    return;
  } 
  
  my @results = map {{
    summary => $_->summary,
    port    => $_->port,
    version => $_->version,
    machine => $_->machine->name,
    arch    => $_->arch,
    id      => $_->id,
    has_details => ($_->summary eq 'pass') ? 0 : 1,
  }} map { $_->current_result } @ports;

  my $tmpl = template($p, 'list.tmpl');

  $tmpl->param(results => \@results, title => "Search Results for &quot;$query&quot;", count => scalar @results);
  
  print $p->header, $tmpl->output;
}

  

sub error {
  my ($msg) = @_;
  
  my $tmpl = template(CGI->new, 'error.tmpl');
  
  $tmpl->param(error => $msg, title => 'Error');
  
  print "Content-Type: text/html\n\n", $tmpl->output;
}
   


sub template {
  my ($p, $file) = @_;
  
  my $tmpl = HTML::Template->new(
    cache    => 1,
    global_vars => 1,
    filename => "/usr/local/www/apache22/tmpls/$file",
    loop_context_vars => 1,
    die_on_bad_params => 0
  );
  
  my $dbh = Magus::Result->db_Main();
  my $sth = $dbh->prepare("SELECT summary,COUNT(*) as count FROM results JOIN ports ON results.port=ports.name AND results.version=ports.version GROUP BY summary ORDER BY count DESC");
  $sth->execute;
  my $stats = $sth->fetchall_arrayref({});
  $sth->finish;

  $sth = $dbh->prepare("SELECT COUNT(DISTINCT port) FROM results");
  $sth->execute;
  my ($count) = $sth->fetchrow_array;
  $sth->finish;
  
  $sth = $dbh->prepare("SELECT COUNT(*) FROM ports WHERE name NOT IN (SELECT port FROM results)");
  $sth->execute;
  my ($untested) = $sth->fetchrow_array;
  $sth->finish;

  my $query = $p->param('q');
  $query ||= '';
  
  $tmpl->param(
    query     => $query,
    ports_tested => $count,
    ports_untested => $untested,
    stats     => $stats,
    title     => 'Magus',
#    breadcrumbs => breadcrumbs(path => $p->path_info or '/'),
    root      => $p->script_name(),
    list_root => $p->script_name() . '/list',
    port_root => $p->script_name() . '/ports',
    result_root => $p->script_name() . '/results',
  );
  
  return $tmpl;
}
  