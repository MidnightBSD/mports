#!/usr/local/bin/perl

use v5.36;
use strict;
use warnings;
use feature qw(signatures);

use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use CGI::Fast;
use Scalar::Util 'looks_like_number';
use String::Clean::XSS;

#
# This is a trick we do so that the abstract search stuff isn't required
# on all the nodes, only the webapp needs this.  We'll just slip
# the search_where() method into Magus::DBI here...
#
{
    package Magus::DBI;
    use Class::DBI::AbstractSearch;
}

while (my $cgi = CGI::Fast->new) {
	eval {
  		main($cgi);
	};

	if ($@) {
	  print "Content-Type: text/html\n\n";
      print <<END_OF_ERROR;
              <!DOCTYPE html>
	      <html>
	      <head><title>Error</title></head>
	      <body>
	      <h1>Error</h1>
	      <p>The following error occured:</p>
	      <pre>$@</pre>
              </body></html>
END_OF_ERROR
	}
}

sub main {
  my ($p) = @_;

  my $path = $p->path_info || '';
  $path =~ s!^/magus!!; # Remove leading /magus if present
  $path =~ s!^/+!/!;    # Ensure only one leading slash

  if ($path =~ m:^/api/runs:) {
    api_runs($p);
    return;
  } elsif ($path =~ m:^/api/run-ports-list:) {
    api_run_port_stats($p);
    return;
  } elsif ($path =~ m:^/api/latest:) {
    api_latest($p);
    return;
  } elsif ($path =~ m:^/async/run-ports-list:) {
    async_run_port_stats($p);
    return;
  } elsif ($path =~ m:^/async/machine-events:) {
    async_machine_events($p);
    return;
  }

  BEGIN{
  require HTML::Template;
  HTML::Template->import();
  }

  if ($path eq '' || $path eq '/') {
    summary_page($p);
  } elsif ($path =~ m:/critical/(.*):) {
    critical_index($p);
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
  } elsif ($path =~ m:^/api/runs:) {
    api_runs($p);
  } elsif ($path =~ m:^/api/run-ports-list:) {
    api_run_port_stats($p);
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

sub is_number {
  my $num = shift;
  return looks_like_number($num) && $num !~ /inf|nan/i;
}

sub api_runs {
  my ($p) = @_;

  require JSON::XS;
  JSON::XS->import();
  require DateTime::Format::Pg;

  my @runs = Magus::Run->retrieve_all({ order_by => 'id DESC' });
  my @runOut;

  foreach my $r (@runs) {
     my $dt = DateTime::Format::Pg->parse_datetime( $r->{created} );
     push(@runOut, {"blessed", $r->{blessed}, "status", $r->{status}, "created", $dt->strftime('%FT%TZ'),  "osversion", $r->{osversion}, "arch", $r->{arch}, "id", $r->{id}});
  }

  print $p->header(
	-type => 'application/json');

  print encode_json(\@runOut);
}

sub api_run_port_stats { 
  my ($p) = @_;

    BEGIN{
  require JSON::XS;
  JSON::XS->import();      
  }
  
  my $run    = $p->param('run');
  my $status = $p->param('status');

  if (!is_number($run)) {
        print $p->header(
            -type => 'application/json',
            -status => '400 Bad Request',
        );
        print "{}";
        return;
  }
    
  my %details = (run => $run, status => $status);
  my @ports;
      
  if ($status eq 'ready') {
    @ports = Magus::Port->search_ready_ports($run);
  } else {
    @ports = Magus::Port->search(run => $run, status => $status, { order_by=> 'name'});
  }

  my @results;
  foreach my $port (@ports) {
     push(@results, { version => $port->{version}, summary => $port->{status}, port => $port->{name},
      flavor    => $port->{flavor},
      arch      => $port->run->arch, 
      id        => $port->{id},
    osversion => $port->run->osversion,
    can_reset => $port->{can_reset} eq 'active' ? 1 : 0,
    description => $port->description,
    license => $port->license,
    www => $port->www,
    cpe => $port->cpe
     });
  }
      
  print $p->header(-type => 'application/json'), encode_json(\@results);
}

sub api_latest {
  my ($p) = @_;

  BEGIN{
    require JSON::XS;
    JSON::XS->import();
    require DateTime;
    require DateTime::Format::Pg;
  }

  my %results;
  my $status = 'pass';
  my %arch;
  
  my @runs = Magus::Run->search(status => 'complete', blessed => 1, { order_by=> 'created DESC, osversion DESC, arch'});

  my $dt;
  foreach my $run (@runs) {
    if (defined($arch{$run->arch})) {
	next;
    }
    if (!defined($dt)) {
	$dt = DateTime::Format::Pg->parse_datetime( $run->{created} );
    }
    $arch{$run->arch} = 1;
    my @ports = Magus::Port->search(run => $run, status => $status, { order_by=> 'name'});
	
    foreach my $port (@ports) {
      if (defined($results{$port->pkgname})) {
	my $found = 0;

        foreach my $r (@{$results{$port->pkgname}->{subpackages}}) {
          if ($port->flavor eq $r->{name}) {
             $found = 1;
             last;
          }
        }
        if ($found == 0 && $port->flavor ne "") {
	  push( @{$results{$port->pkgname}->{subpackages}}, { name => $port->flavor });
        }
       } else {
         my @cats = map {{ category => $_->category }} $port->categories;

         my @subpackages; 
         if (defined($port->flavor) && $port->flavor ne "") {
           push(@subpackages, { name => $port->flavor });
         }

         $results{$port->pkgname} = { 
          version => $port->{version}, port => $port->name,
          osversion => $port->run->osversion,
          summary => $port->description,
          licenses => [ split(' ', $port->license) ],
          homepages => [$port->www],
          categories => \@cats,
          subpackages => \@subpackages,
          cpe => $port->cpe
         };
       }
    }
  }

  my %meta;
  $meta{repository_name} = 'MidnightBSD mports';
  $meta{last_update} =  $dt->strftime('%FT%TZ');
  $meta{num_packages} = scalar(%results);
  $meta{packages} = \%results;
    
  print $p->header(-type => 'application/json'), encode_json(\%meta);
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

    if (!is_number($run_id1) || !is_number($run_id2)) {

            print $p->header(
                -type=>'text/plain',
                -status=> '400 Bad Request'
            );
            print "One or more run ids missing.\n";
            return;

    }
  
  my $tmpl = template($p, 'compare.tmpl');

  # XXX - this isn't quite right, will improve later.
  my $run1 = Magus::Run->retrieve($run_id1);
  my $run2 = Magus::Run->retrieve($run_id2);
  
  $tmpl->param(title => "Magus :: Compare $run_id1 - $run_id2");

  my @ports1 = Magus::Port->search(run => $run_id1, {order_by => 'name'});
  my @ports2 = Magus::Port->search(run => $run_id2, {order_by => 'name'});
  my @critical = Magus::CriticalPorts->search(arch => $run1->{arch}, { order_by => 'arch, pkgname' });
  my %results;
 
  $run1->{ports} = @ports1;
  $run2->{ports} = @ports2;

  foreach my $p (@ports1) {
    my $found = 0;
    foreach my $crit (@critical) {
      if ($p->{pkgname} eq $crit->{pkgname}) {
        $found = 1;
        last;
      }
    }
    $results{$p->{name}} = { name => $p->{name}, version1 => $p->{version}, status1 => $p->{status}, critical => $found  };
  }

  foreach my $p2 (@ports2) {
    my $found = 0;
    foreach my $crit (@critical) {
      if ($p2->{pkgname} eq $crit->{pkgname}) {
        $found = 1;
        last;
      }
    }

    if ($results{$p2->{name}}) {
      $results{$p2->{name}}->{version2} = $p2->{version};
      $results{$p2->{name}}->{status2} = $p2->{status};
      $results{$p2->{name}}->{critical} = $found;
    } else {
      $results{$p2->{name}} = { name => $p2->{name}, version2 => $p2->{version}, status2 => $p2->{status}, critical => $found};
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
    flavor    => $_->flavor,
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

    if (!is_number($run)) {
        print $p->header(
            -type => 'text/plain',
            -status => '400 Bad Request'
        );
        print "400 Bad Request\n";
        return;
    }

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

    if (!is_number($run)) {
	print $p->header(
            -type => 'text/plain',
            -status => '400 Bad Request'
        );
        print "400 Bad Request\n";
        return;
    }

    eval {
        $run = Magus::Run->retrieve($run) || die("No such run");
    };
    if ($@) {
        print $p->header(
            -type => 'text/plain',
            -status => '404 Not Found'
        );
        print "404 Not Found\n";
        return;
    }

  my $tmpl = template($p, "run.tmpl");
  $tmpl->param(title => "Run $run");
  $tmpl->param(map { $_ => $run->$_ } qw(osversion arch status created id blessed));
  
  my $dbh = Magus::Run->db_Main();  
  
  my $sth = $dbh->prepare("SELECT COUNT(*) AS count,status FROM ports WHERE run=? GROUP BY status ORDER BY status");
  $sth->execute($run->id);
  my $status_stats = $sth->fetchall_arrayref({});
  $sth->finish;

  push(@$status_stats, { status => 'ready', count => Magus::Port->search_ready_ports($run)->count });
  $tmpl->param(status_stats => $status_stats);

  my $sth2 = $dbh->prepare("WITH hourly_events AS (
    SELECT
        DATE_TRUNC('hour', events.time) AS hour,
        COUNT(*) AS event_count
    FROM events
    INNER JOIN ports ON events.port = ports.id
    WHERE ports.run=?
    GROUP BY DATE_TRUNC('hour', events.time)
)
SELECT
    ROUND(AVG(event_count)::numeric, 2) AS average_events_per_hour,
    MIN(event_count) AS min_events_per_hour,
    MAX(event_count) AS max_events_per_hour,
    COUNT(*) AS total_hours
FROM hourly_events");
  $sth2->execute($run->id);
  my $metrics = $sth2->fetchall_arrayref({});
  $sth2->finish;
  $tmpl->param(metrics => $metrics);

  print $p->header;
  print $tmpl->output;
}
  

sub port_page {
  my ($p, $port) = @_;
  
  my $tmpl = template($p, "port.tmpl");

    if (!is_number($port)) {
        print $p->header(
            -type => 'text/plain',
            -status => '400 Bad Request'
        );
        print "400 Bad Request\n";
        return;
    }

  eval { 
      $port = Magus::Port->retrieve($port) || die "No such port: $port";
  };
  if ($@) {
      print $p->header(
              -type=>'text/plain',
              -status=> '404 Not Found'
    );
    print "404 Not Found\n";
    return;
  }

  $tmpl->param(
    port      => $port->name,
    flavor    => $port->flavor,
    pkgname   => $port->pkgname, 
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
    warn      => $port->status eq "warn",
    cpe       => $port->cpe,
    tm        => time()
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

    if (!is_number($machine)) {
        print $p->header(
            -type => 'text/plain',
            -status => '400 Bad Request'
        );
        print "400 Bad Request\n";
        return;
    }

    eval {
        $machine = Magus::Machine->retrieve($machine) || die "No such machine: $machine\n";
    };
    if ($@) {
        print $p->header(
            -type=>'text/plain',
            -status=> '404 Not Found'
        );
        print "404 Not Found\n";
        return;
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


sub machine_index {
  my ($p) = @_;

  my @machines = Magus::Machine->retrieve_all({ order_by => 'osversion DESC, id' });

  my $tmpl = template($p, 'machines.tmpl');

  $tmpl->param(
    title      => 'Magus // Machines',
    machines       => \@machines,
  );

  print $p->header, $tmpl->output;
}

sub critical_index {
  my ($p) = @_;

  my @critical = Magus::CriticalPorts->retrieve_all({ order_by => 'arch, pkgname' });

  my $tmpl = template($p, 'critical.tmpl');

  $tmpl->param(
      title      => 'Magus // Critical',
      critical       => \@critical,
  );

  print $p->header, $tmpl->output;
}

sub search {
  my ($p, $query, $tmpl_params) = @_;
  
  $query  ||= clean_XSS($p->param('q'));
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
    flavor    => $_->flavor,
    pkgname   => $_->pkgname,
    version   => $_->version,
    arch      => $_->run->arch,
    id        => $_->id,
    run       => $_->run,
    osversion => $_->run->osversion,
    can_reset => $_->can_reset ? 1 : 0,
  }} @ports;

  my $tmpl = template($p, 'list.tmpl');

  $tmpl->param(results => \@results, title => "Search Results for &quot;$origq&quot;", count => scalar @results, query => $query);
 
  if ($tmpl_params) {
    $tmpl->param(%$tmpl_params);
  }
  
  print $p->header(-status=>200,-type=> 'text/html', -'X-XSS-Protection'=> '1; mode=block'), $tmpl->output;
}

sub async_machine_events {
  my ($p) = @_;

  BEGIN{
  require JSON::XS;
  JSON::XS->import();      
  }
  
  my $run     = $p->param('run');
  my $machine = $p->param('machine');

    if (!is_number($run) || !is_number($machine)) {
        print $p->header(
            -type => 'text/plain',
            -status => '400 Bad Request'
        );
        print "400 Bad Request\n";
        return;
    }
  
  my @events = map { {
    type       => $_->type,
    msg        => $_->msg,
    port       => $_->port->name,
    port_id    => $_->port->id,
    run        => $_->port->run->id,
    time       => $_->time,
  }} Magus::Event->search_by_run_and_machine($run, $machine);
  
  my %details = (run => $run, machine => $machine, events => \@events);
  
  my $coder = JSON::XS->new->utf8->pretty->allow_nonref->allow_blessed->canonical;
  print $p->header(-type => 'application/json'), $coder->encode(\%details);
}

sub async_run_port_stats {
  my ($p) = @_;

  BEGIN{
  require JSON::XS;
  JSON::XS->import();      
  }
  
  my $run    = $p->param('run');
  my $status = $p->param('status');

    if (!is_number($run)) {
        print $p->header(
            -type => 'text/plain',
            -status => '400 Bad Request'
        );
        print "400 Bad Request\n";
        return;
    }
  
  my @ports;
  
  if ($status eq 'ready') {
    @ports = Magus::Port->search_ready_ports($run);
  } else {
    @ports = Magus::Port->search(run => $run, status => $status, { order_by=> 'name'});
  }
  
  my @results = map {{
    summary   => $_->status,
    port      => $_->name,
    flavor    => $_->flavor,
    pkgname   => $_->pkgname,
    version   => $_->version,
    arch      => $_->run->arch,
    id        => $_->id,
    run       => $_->run,
    osversion => $_->run->osversion,
    can_reset => $_->can_reset eq 'active' ? 1 : 0,
  }} @ports;
                                  
#  my $tmpl = template($p, 'port-list.tmpl');
#  $tmpl->param(results => \@results);

#  $details{html} = $tmpl->output;
  
#  print $p->header(-type => 'application/json', -Access-Control-Allow-Origin => '*'), encode_json(\%details);


  my %details = (run => $run, status => $status, events => \@results);
   
  my $coder = JSON::XS->new->utf8->pretty->allow_nonref->allow_blessed->canonical;
  print $p->header(-type => 'application/json'), $coder->encode(\%details);

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
        return;
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

  # should be dynamic but seems to fail with fast cgi
  my $root = '/magus'; #$p->script_name();

  $tmpl->param(
      query         => $query,
      title         => 'Magus',
      root          => $root,
      run_root      => $root . '/runs',
      port_root     => $root . '/ports',
      machine_root  => $root . '/machines',
      browse_root   => $root . '/browse',
      critical_root => $root . '/critical'
  );
  
  return $tmpl;
}
  
