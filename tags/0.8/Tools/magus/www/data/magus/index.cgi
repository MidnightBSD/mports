#!/usr/bin/perl

use strict;
use warnings;

use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use CGI::Fast;
use HTML::Template;
use JSON::XS;

#
# This is a trick we do so that the abstract search stuff isn't required
# on all the nodes, only the webapp needs this.  We'll just slip
# the search_where() method into Magus::DBI here...
#
{
    package Magus::DBI;
    use Class::DBI::AbstractSearch;
}

while (my $p = CGI::Fast->new) {
	eval {
  		main($p);
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
	}
}

sub main {
  my ($p) = @_;
  
  my $path = $p->path_info;

  if ($path eq '' || $path eq '/') {
    summary_page($p);
  } elsif ($path =~ m:/machines/(.*):) {
    if ($1) {
      machine_page($p, $1);
    } else {
      machine_index($p);
    }
  } elsif ($path =~ m:^/runs/(.*):) {
    if ($1) {
      run_page($p, $1);
    } else {
      run_index($p);
    }
  } elsif ($path =~ m:^/ports/(.*):) {
    port_page($p, $1);
  } elsif ($path =~ m:^/async/run-ports-list:) {
    async_run_port_stats($p);
  } elsif ($path =~ m:^/async/machine-events:) {
    async_machine_events($p);
  } elsif ($path =~ m:^/search:) {
    search($p);
  } elsif ($path =~m:^/browse/(.*):) {
    browse($p, $1);
  } elsif ($path =~m:^/compare/:) {
    compare_runs($p);
  } elsif ($path =~m:^/blockers/(.*):) {
    blockers($p, $1);
  } else {
    print $p->header(
              -type=>'text/plain',
              -status=> '404 Not Found'
    );
    print "Unknown path: $path\n";
  }
}

sub run_index {
  my ($p) = @_;
  my $tmpl = template($p, 'runlist.tmpl');

  my @runs = Magus::Run->retrieve_all({ order_by => 'id DESC' });

  $tmpl->param(
    runs       => \@runs,
  );
   
  print $p->header, $tmpl->output;
}

sub compare_runs {
  my ($p) = @_;

  my $run_id1 = $p->param('run1');
  my $run_id2 = $p->param('run2');

    if (!defined($run_id1) || !defined($run_id2)) {

            print $p->header(
                -type=>'text/plain',
                -status=> '400 Bad Request'
            );
            print "One or more run ids missing.\n";
            exit;

    }
  
  my $tmpl = template($p, 'compare.tmpl');

  # XXX - this isn't quite right, will improve later.
  my $run1 = Magus::Run->retrieve($run_id1);
  my $run2 = Magus::Run->retrieve($run_id2);
  
  $tmpl->param(title => "Magus :: Compare $run_id1 - $run_id2");

  my @ports1 = Magus::Port->search(run => $run_id1, {order_by => 'name'});
  my @ports2 = Magus::Port->search(run => $run_id2, {order_by => 'name'});
  my %results;
 
  $run1->{ports} = @ports1;
  $run2->{ports} = @ports2;

  foreach my $p (@ports1) {
    $results{$p->{name}} = { name => $p->{name}, version1 => $p->{version}, status1 => $p->{status}};
  }

  foreach my $p2 (@ports2) {
    if ($results{$p2->{name}}) {
      $results{$p2->{name}}->{version2} = $p2->{version};
      $results{$p2->{name}}->{status2} = $p2->{status};
    } else {
      $results{$p2->{name}} = { name => $p2->{name}, version2 => $p2->{version}, status2 => $p2->{status}};
    }
  }

  my @a;
  foreach my $k (keys %results) {
    push(@a, $results{$k});
  }
  my @sorted =  sort { $a->{name} cmp $b->{name} } @a;

  $tmpl->param(
    run_id1    => $run_id1,
    run_id2    => $run_id2,
    ding    => \@sorted
  );
    
  print $p->header, $tmpl->output;
}

sub summary_page {
  my ($p) = @_;
  
  Magus::Port->set_sql(last_twenty => qq{
      SELECT __ESSENTIAL__
      FROM __TABLE__
      WHERE status!='untested'
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
    port       => $_->port->name,
    port_id    => $_->port->id,
    machine    => $_->machine->name,
    machine_id => $_->machine->id,
    arch       => $_->port->run->arch,
    run        => $_->port->run->id,
    osversion  => $_->port->run->osversion,
    id	       => $_->id,
  }} sort { ($a->machine->name cmp $b->machine->name) || ($a->port->run <=> $b->port->run) } Magus::Lock->retrieve_all;

  my @runs = map {{
    run       => $_->id,
    arch      => $_->arch,
    osversion => $_->osversion,
    created   => $_->created,
  }} Magus::Run->search(status => 'active');
  
  my @categories = map {{
    category => $_->category
  }} Magus::Category->retrieve_all;
  
  $tmpl->param(
    runs  => \@runs,
    locks => \@locks,
    cats  => \@categories,
  ); 
  print $tmpl->output;
}

sub blockers {
	my ($p, $run) = @_;

	my %objs;
	my %blocking;
	my $ports = Magus::Port->search(run => $run, status => 'untested');

    my $tmpl = template($p, "blockers.tmpl");
    $tmpl->param(title => "Top Blockers for Run $run");

while (my $port = $ports->next) {
  my $add = $blocking{$port} || 1;
  $objs{$port} ||= $port;

  foreach my $dep ($port->depends) {
    next unless $dep->status eq 'fail' || $dep->status eq 'skip' || $dep->status eq 'untested';
    
    
    $objs{$dep}    ||= $dep;
    $blocking{$dep} += $add;
  }    
}

my @blocks;
foreach my $port (sort { $blocking{$b} <=> $blocking{$a} } keys %blocking) {
  next if $objs{$port}->status eq 'untested';
  push(@blocks, { port => $port, blocking => $blocking{$port} });
}
$tmpl->param(blocks => \@blocks);
print $p->header;
print $tmpl->output;
}

sub run_page {
    my ($p, $run) = @_;

    eval {
        $run = Magus::Run->retrieve($run) || die("No such run");
    };
    if ($@) {
        print $p->header(
            -type => 'text/plain',
            -status => '404 Not Found'
        );
        print "404 Not Found\n";
        exit;
    }

  my $tmpl = template($p, "run.tmpl");
  $tmpl->param(title => "Run $run");
  $tmpl->param(map { $_ => $run->$_ } qw(osversion arch status created id));
  
  my $dbh = Magus::Run->db_Main();  
  
  my $sth = $dbh->prepare("SELECT COUNT(*) AS count,status FROM ports WHERE run=? GROUP BY status ORDER BY status");
  $sth->execute($run->id);
  my $status_stats = $sth->fetchall_arrayref({});
  $sth->finish;

  push(@$status_stats, { status => 'ready', count => Magus::Port->search_ready_ports($run)->count });
  
  $tmpl->param(status_stats => $status_stats);
  
  print $p->header;
  print $tmpl->output;
}
  

sub port_page {
  my ($p, $port) = @_;
  
  my $tmpl = template($p, "port.tmpl");

  eval { 
      $port = Magus::Port->retrieve($port) || die "No such port: $port";
  };
  if ($@) {
      print $p->header(
              -type=>'text/plain',
              -status=> '404 Not Found'
    );
    print "404 Not Found\n";
    exit;
  }

  $tmpl->param(
    port      => $port->name, 
    id        => $port->id,
    title     => "Magus // $port",
    desc      => $port->description,
    www       => $port->www,
    version   => $port->version,
    run       => $port->run->id,
    osversion => $port->run->osversion,
    arch      => $port->run->arch,
    status    => $port->status,
    license   => $port->license,
    restricted => $port->restricted,
    can_reset => $port->can_reset? 1 : 0,
    fail      => $port->status eq "fail",
    pass      => $port->status eq "pass",
    warn      => $port->status eq "warn"
  );
  
  my @events = map { { 
    machine_id => $_->machine->id,
    machine    => $_->machine->name,
    type       => $_->type,
    msg        => $_->msg,
    time       => $_->time,
  } } $port->events;
  
  if (@events) {
    $tmpl->param(events => \@events);
  }
    
  my @depends;
  my @fullDepends = Magus::Depend->search( port => $port->id, { order_by=> 'type, dependency' });

      foreach my $item (@fullDepends) {
		my %h;
		$h{id} = $item->dependency->id;
		$h{port} = $item->dependency->name;
		$h{status} = $item->dependency->status;
 		$h{type} = $item->type;
              push @depends, \%h;
      }

  if (@depends) {
    $tmpl->param(depends => \@depends);
  }
  
  my @depends_of = map { {
    port   => $_->name,
    id     => $_->id,
    status => $_->status
  } } map { Magus::Port->retrieve($_->port) } Magus::Depend->search(dependency => $port);
  
  if ($port->log) {
    $tmpl->param(log => $port->log);
  }
  
  if (@depends_of) {
    $tmpl->param(depends_of => \@depends_of);
  }
  
  my @cats = map {{ category => $_->category }} $port->categories;
  
  $tmpl->param(cats => \@cats);
  print $p->header, $tmpl->output;
}


sub machine_page {
  my ($p, $machine) = @_;

    eval {
        $machine = Magus::Machine->retrieve($machine) || die "No such machine: $machine\n";
    };
    if ($@) {
        print $p->header(
            -type=>'text/plain',
            -status=> '404 Not Found'
        );
        print "404 Not Found\n";
        exit;
    }

  my $tmpl = template($p, 'machine.tmpl');

  (my $maint = $machine->maintainer) =~ s/\@/{...}/;

  # XXX - this isn't quite right, will improve later.
  my @runs = map {{
    run => $_->id
  }} Magus::Run->search(arch => $machine->arch, osversion => $machine->osversion, { order_by => 'id DESC' });

     
  $tmpl->param(
    title      => 'Magus // Machine // ' . $machine->name,
    id         => $machine->id,
    name       => $machine->name,
    maintainer => $maint,
    arch       => $machine->arch,
    run        => $machine->run,
    osversion  => $machine->osversion,
    runs       => \@runs,
  );
    
  print $p->header, $tmpl->output;
}


sub search {
  my ($p, $query, $tmpl_params) = @_;
  
  $query  ||= $p->param('q');
  my $origq = $query;
  my %where;
  while ($query =~ s/(\S+):(\S+)//) {
    push(@{$where{$1}}, $2)
  }
    
  $query =~ s/^\s*//;
  $query =~ s/\s*$//;
  $query =~ s/\*/%/g;
    
  if ($where{status}) {
    delete $where{status} if grep { m/any/i } @{$where{status}};
  } elsif (!%where) {
    $where{status} = { '!=', 'untested' };
  }

  $where{name} ||= { like => "%$query%" } if $query;


  for (keys %where) {
    delete $where{$_} if m/\W/;
  }      
  
  my @ports = Magus::Port->search_where(\%where, { order_by => 'name,run' });
  
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
    can_reset => $_->can_reset ? 1 : 0,
  }} @ports;

  my $tmpl = template($p, 'list.tmpl');

  $tmpl->param(results => \@results, title => "Search Results for &quot;$origq&quot;", count => scalar @results);
  
  if ($tmpl_params) {
    $tmpl->param(%$tmpl_params);
  }
  
  print $p->header, $tmpl->output;
}

sub async_machine_events {
  my ($p) = @_;
  
  my $run     = $p->param('run');
  my $machine = $p->param('machine');
  
  my @events = map { {
    type       => $_->type,
    msg        => $_->msg,
    port       => $_->port,
    port_id    => $_->port->id,
    run        => $_->port->run,
    time       => $_->time,
  }} Magus::Event->search_by_run_and_machine($run, $machine);
  
  my %details = (run => $run, machine => $machine);
  
  my $tmpl = template($p, 'machine-events.tmpl');
  $tmpl->param(events => \@events);

  $details{html} = $tmpl->output;
  
  print $p->header(-type => 'text/plain'), encode_json(\%details);
}

sub async_run_port_stats {
  my ($p) = @_;
  
  my $run    = $p->param('run');
  my $status = $p->param('status');
  
  my %details = (run => $run, status => $status);
  my @ports;
  
  if ($status eq 'ready') {
    @ports = Magus::Port->search_ready_ports($run);
  } else {
    @ports = Magus::Port->search(run => $run, status => $status, { order_by=> 'name'});
  }
  
  my @results = map {{
    summary   => $_->status,
    port      => $_->name,
    version   => $_->version,
    arch      => $_->run->arch,
    id        => $_->id,
    run       => $_->run,
    osversion => $_->run->osversion,
    can_reset => $_->can_reset eq 'active' ? 1 : 0,
  }} @ports;
                                  
  my $tmpl = template($p, 'port-list.tmpl');
  $tmpl->param(results => \@results);

  $details{html} = $tmpl->output;
  
  print $p->header(-type => 'text/plain'), encode_json(\%details);
}
  
sub browse {
    my ($p, $path) = @_;
    my $cat;

    if ($path =~ m:(.*?)/(.+):) {
        return search($p,
        "name:$path status:any",
        {title => '<a href="'.$p->script_name . qq[/browse/$1">$1</a>/$2]}
        );
    }

    # $path is a category
    eval {
        $cat = Magus::Category->retrieve(category => $path) || die "No such category: $path\n";
    };
    if ($@) {
        print $p->header(
            -type => 'text/plain',
            -status => '404 Not Found'
        );
        print "404 Not Found\n";
        exit;
    }

    my $tmpl = template($p, "category.tmpl");
    $tmpl->param(
        title    => "Magus // Browse // $path",
        ports    => [map {
            {
                port => $_
            }
        } sort @{$cat->distinct_ports}],
        category => $path,
    );

    print $p->header. $tmpl->output;
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
    browse_root  => $p->script_name() . '/browse',
  );
  
  return $tmpl;
}
  
