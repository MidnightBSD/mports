#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;
use CGI;
use HTML::Template;

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
  } elsif ($path =~ m:/results/(\d+)/log:) {
    log_page($p, $1);
  } elsif ($path =~ m:/results/(\d+)/details:) {
    subresults_page($p, $1);
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
    has_log => defined $_->logs->next,
    has_subresults => defined $_->subresults->next,
  }} $port->results;
  
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

sub subresults_page {
  my ($p, $id) = @_;

  my $tmpl = template($p, "subresults.tmpl");

  my $result = Magus::Result->retrieve($id) || die "No such results: $id";

  my @subresults = map { {
	phase => $_->phase,
	type  => $_->type,
	name  => $_->name,
	msg   => $_->msg
  }} $result->subresults;

  if (@subresults) {
    $tmpl->param(
      subresults => \@subresults,
    );
  }

  print $p->header, $tmpl->output;
}



sub log_page {
  my ($p, $id) = @_;
  
  my $result = Magus::Result->retrieve($id) || die "No such result.";
  
  my $log = $result->logs->next;
  
  my $tmpl = template($p, 'log.tmpl');
  
  $tmpl->param(port => $result->port, log => $log->data);
  
  print $p->header, $tmpl->output;
}

sub list_page {
  my ($p, $summary) = @_;
  
  my @results = map {{
    summary => $_->summary,
    port    => $_->port,
    version => $_->version,
    machine => $_->machine->name,
    arch    => $_->arch 
  }} sort { $b->id <=> $a->id } Magus::Result->search(summary => $summary);
  
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
  
  $tmpl->param(
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
  