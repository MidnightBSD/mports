#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use CGI;
use HTML::Template;
use JSON::XS;

eval {
  main();
  exit 0;
};

if ($@) {
  print "Content-Type: text/html\n\n";
  print <<END_OF_ERROR;
      <html>
      <head><title>Error</title></head>
      <body>
      <h1>Error</h1>
      <p>The following error occured:</p>
      <pre>$@</pre>
END_OF_ERROR
  exit 0;
}

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
  
  Magus::Port->set_sql(last_twenty => qq{
      SELECT __ESSENTIAL__
      FROM __TABLE__
      ORDER BY updated DESC LIMIT 20
  });
  
  my @results = map {{
    summary   => $_->status,
    port      => $_->name,
    port_id   => $_->id,
    version   => $_->version,
    osversion => $_->run->osversion,
    arch      => $_->run->arch, 
  }} Magus::Port->search_last_twenty;
  
  print $p->header;
  
  my $tmpl = template($p, 'index.tmpl');
  
  $tmpl->param(
    title     => 'Magus Summary', 
    results   => \@results
  );
  
  my @locks = map {{
    port      => $_->port->name,
    port_id   => $_->port->id,
    machine   => $_->machine->name,
    arch      => $_->port->run->arch,
    run       => $_->port->run->id,
    osversion => $_->port->run->osversion,
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
    id        => $port->id,
    title => "Magus // $port",
    desc  => $port->description,
    www   => $port->www,
    version => $port->version,
    run     => $port->run->id,
    osversion => $port->run->osversion,
    arch      => $port->run->arch,
    status    => $port->status,
  );
  
  my @events = map { { 
    machine_id => $_->machine->id,
    machine    => $_->machine->name,
    type       => $_->type,
    msg        => $_->msg
  } } $port->events;
  
  if (@events) {
    $tmpl->param(events => \@events);
  }
    
  my @depends = map { {
    port => $_->name,
    id   => $_->id
  } } $port->depends;

  if (@depends) {
    $tmpl->param(depends => \@depends);
  }
  
  my @depends_of = map { {
    port => $_->name,
    id   => $_->id
  } } map { Magus::Port->retrieve($_->port) } Magus::Depend->search(dependency => $port);
  
  if ($port->log) {
    $tmpl->param(log => $port->log);
  }
  
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
    my $id = $ports[0]->id;
    print $p->redirect("http://www.midnightbsd.org/magus/ports/$id");
    return;
  } 
  
  my @results = map {{
    summary   => $_->status,
    port      => $_->name,
    version   => $_->version,
    arch      => $_->run->arch,
    id        => $_->id,
    run       => $_->run,
    osversion => $_->run->osversion,
  }} @ports;

  my $tmpl = template($p, 'list.tmpl');

  $tmpl->param(results => \@results, title => "Search Results for &quot;$query&quot;", count => scalar @results);
  
  print $p->header, $tmpl->output;
}

  

sub template {
  my ($p, $file) = @_;
  
  my $tmpl = HTML::Template->new(
    cache    => 1,
    global_vars => 1,
    filename => "/home/mbsd/magus/mports/Tools/magus/www/tmpls/$file",
    loop_context_vars => 1,
    die_on_bad_params => 0
  );
  
  my $query = $p->param('q');
  $query ||= '';
  
  $tmpl->param(
    query     => $query,
    title     => 'Magus',
    root      => $p->script_name(),
    run_root  => $p->script_name() . '/runs',
    port_root => $p->script_name() . '/ports',
    machine_root => $p->script_name() . '/machines',
  );
  
  return $tmpl;
}
  