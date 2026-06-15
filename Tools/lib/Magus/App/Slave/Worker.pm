package Magus::App::Slave::Worker;

use strict;
use warnings;

use File::Basename qw(basename dirname);
use File::Path qw(mkpath);
use IO::Socket::INET;
use IO::Select;
use IPC::Open3 qw(open3);
use Symbol qw(gensym);
use Text::ParseWords qw(shellwords);
use Mport::Globals qw($MAKE $ROOT);
use Magus::Run ();

sub run {
  my ($class, %args) = @_;
  
  local $SIG{CHLD} = 'DEFAULT';
  local $SIG{TERM} = sub { die "SIGTERM\n" };
  local $SIG{INT}  = sub { die "SIGINT\n" };
  
  my $self = bless \%args, $class;
  
  eval {
    $self->{port} = $self->{lock}->port;
    $self->{phase} = $self->{lock}->phase || 'build';
    $self->log->info("Starting $self->{phase} phase for $self->{port}");
    $self->{port}->set_phase_status($self->{phase}, 'running');
    $self->{port}->note_event(info => ucfirst($self->{phase}) . " Started", $self->{phase}, 'PhaseStarted');
    $self->run_phase();
    $self->{port}->refresh;
    $self->{port}->note_event($self->{port}->phase_status($self->{phase}) => ucfirst($self->{phase}) . " complete.", $self->{phase}, 'PhaseComplete');
  }; 
  
  if ($@) {
	if ($@ =~ m/DBI/) {
	  # we want to let the parent know that we lost the DB connection.
	  exit 6;
	} elsif ($@ =~ m/SIGINT/ || $@ =~ /SIGTERM/) {
	  return;
	} 
	
	# we make sure we never have an uncaught exception!
	my $error = $@;
	eval { 
	  my $port = $self->port;
	  my $phase = $self->{phase} || 'build';
	  $self->log->err("Exception thrown during $phase phase for $port: $error");
	  if ($phase eq 'build') {
	    $port->set_result_internal("Exception thrown: $error");
	  } else {
	    $port->set_phase_status($phase, 'internal');
	    $port->note_event(internal => "Exception thrown: $error", $phase, 'Exception');
	  }
        };
        
        if ($@ && $@ =~ m/DBI/) {
          $self->log->err($@);
          exit 6;
        }
  }
}

sub run_phase {
  my ($self) = @_;

  my $phase = $self->{phase};

  if ($phase eq 'scan') {
    $self->run_scan_phase();
    return;
  }

  $self->prep_chroot();

  if ($phase eq 'build') {
    $self->inject_depends();
    $self->inject_distfiles();
    $self->run_make_phase('build');
    $self->{port}->refresh;
    if ($self->{port}->status eq 'pass' || $self->{port}->status eq 'warn') {
      $self->upload_pkgfile();
      $self->upload_distfiles();
    }
    return;
  }

  if ($phase eq 'fetch') {
    $self->inject_distfiles();
    $self->run_make_phase('fetch');
    $self->{port}->refresh;
    if ($self->{port}->phase_status('fetch') eq 'pass' || $self->{port}->phase_status('fetch') eq 'warn') {
      $self->upload_distfiles();
    }
    return;
  }

  if ($phase eq 'test') {
    $self->inject_depends();
    $self->inject_pkgfile($self->{port});
    $self->inject_distfiles();
    $self->run_make_phase('test');
    return;
  }

  die "Unknown Magus phase: $phase\n";
}

sub prep_chroot {
  my ($self) = @_;
 
  $self->log->debug("Preparing chroot $self->{worker_id}");
  
  $self->{chroot} = Magus::Chroot->new(
    workerid => $self->{worker_id},
    tarball  => $Magus::Config{ChrootTarBall},
  );
}


sub inject_depends {
  my ($self) = @_;
  
  foreach my $depend ($self->{port}->all_depends) {
    if ($depend->status eq 'pass' || $depend->status eq 'warn') {
      # There should be a package that we can use to install the port.
      $self->inject_pkgfile($depend);
      next;
    }
  
    die "Port was scheduled as ready to build, but $depend had not been built successfuly.\n";
  }
}

sub inject_pkgfile {
  my ($self, $port) = @_;
  
  my $chroot = $self->{chroot};
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $run  = $port->run->id;
  my $dest = join('/', $chroot->root, $chroot->packages, 'All');
  
  my $src = "$Magus::Config{'PkgfilesRoot'}/$run/$file";
  
  $self->log->debug("downloading: $run/$file");
  
  my ($exit, $out) = $self->run_command('/usr/bin/scp', $src, $dest);
  
  if ($exit != 0) {
    die "scp returned non-zero: $out\n";
  }
}

sub inject_distfiles {
  my ($self) = @_;

  my $port = $self->{port};
  my $chroot = $self->{chroot};
  my $run  = $port->run->id;

  foreach my $distfile ($port->distfiles) {
    my $file = $self->distfile_cache_path($distfile->filename) or next;
    my $dest = join('/', $chroot->root, $chroot->distfiles, $file);
    if (-e $dest) {
      $self->log->debug("download skipped, already present: $run/$file");
      next;
    }
    $self->ensure_parent_dir($dest);

    my $src = "$Magus::Config{'DistfilesRoot'}/$run/$file";

    $self->log->debug("downloading: $run/$file");

    my ($exit, $out) = $self->run_command('/usr/bin/scp', $src, $dest);

    if ($exit != 0) {
      $self->log->debug("download failed: $run/$file $out");
      $self->inject_previous_run_distfile($file, $dest);
    }
  }
}

sub inject_previous_run_distfile {
  my ($self, $file, $dest) = @_;

  my $previous_run = $self->previous_run or return;
  my $run = $previous_run->id;
  my $src = "$Magus::Config{'DistfilesRoot'}/$run/$file";

  $self->log->debug("downloading from previous run: $run/$file");

  my ($exit, $out) = $self->run_command('/usr/bin/scp', $src, $dest);

  if ($exit != 0) {
    $self->log->debug("previous run download failed: $run/$file $out");
  } else {
    $self->log->debug("downloaded from previous run: $run/$file");
  }
}

sub previous_run {
  my ($self) = @_;

  return $self->{previous_run} if exists $self->{previous_run};

  my $run = $self->{port}->run;
  my $run_id = Magus::Run->db_Main->selectrow_array(
    q{
      SELECT id
        FROM runs
       WHERE arch = ?
         AND osversion = ?
         AND id < ?
       ORDER BY id DESC
       LIMIT 1
    },
    undef,
    $run->arch,
    $run->osversion,
    $run->id,
  );

  return $self->{previous_run} = $run_id ? Magus::Run->retrieve($run_id) : undef;
}


sub run_make_phase {
  my ($self, $phase) = @_;
  
  my $port = $self->{port};
  my $chroot = $self->{chroot};

  # we fork so just the child chroots, then we can get out of the chroot.
  my $pid = fork();
  if ($pid) {
    # Parent, we wait for the child to finish, and if we get sigint
    # while we are waiting, we stop the child and then cleanup
    local $SIG{INT} = sub { 
      waitpid($pid, 0);
      $self->{port}->reset;
      exit(0);
    };
    
    waitpid($pid, 0);
  } elsif (defined $pid) {
    # child here; chroot and test the port
    eval {
      $chroot->do_chroot();
      chdir($port->origin);
    
      my $test = Magus::PortTest->new(port => $port, chroot => $chroot);

      $self->log->info("Running $phase phase for $port");

      my $results = $test->run($phase);
  
      $self->insert_results($phase, $results);
    };
    
    if ($@) {
      if ($@ =~ m/SIGINT/ || $@ =~ m/DBI/) {
        exit(0);
      }
      # make sure we get to that exit() down there. 
      my $error = $@;
      $self->log->err("Exception thrown during $phase phase for $port: $error");
      eval {
        if ($phase eq 'build') {
          $port->set_result_internal("Exception thrown: $error");
        } else {
          $port->set_phase_status($phase, 'internal');
          $port->note_event(internal => "Exception thrown: $error", $phase, 'Exception');
        }
      };
    }
    
    exit(0);
  } else {
    die "Could not fork: $!\n";
  } 

  # Back to the parent here
  if ($? == 0) {
    # update our port object with new data from the database, as the child
    # process probably changed stuff
    $port->refresh;
  } else {
    die "Child exited unexpectedly: $?\n";
  }
}  

sub insert_results {
  my ($self, $phase, $results) = @_;
  
  $self->log->info("Inserting $phase results for %s; summary: $results->{summary}", $self->port);

  if ($phase eq 'build') {
    $self->port->status($results->{'summary'});
    $self->port->update;
  }

  $self->port->set_phase_status($phase, $results->{'summary'});
            
  my %type_conversion = (skip => 'skip', warning => 'warn', error => 'fail');
                
  foreach my $type (qw(skip warning error)) {
    next unless $results->{$type . 's'};
                          
    foreach my $sr (@{$results->{$type . 's'}}) {
      $self->port->note_event($type_conversion{$type} => $sr->{msg}, $phase, $sr->{name});
    }
  }  
                                            
  if ($results->{log}) {
    $self->replace_phase_log($phase, $results->{log}->{data});
    if ($phase eq 'build') {
      Magus::Log->search(port => $self->port)->delete_all;
      Magus::Log->insert({ port => $self->port, data => $results->{log}->{data}});
    }
  }
}

sub run_scan_phase {
  my ($self) = @_;

  my $port = $self->{port};
  my $run = $port->run->id;
  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $pkgfile = "$Magus::Config{'PkgfilesRoot'}/$run/$file";

  if (!-f $pkgfile) {
    my $msg = "Package file is missing: $pkgfile";
    $port->set_phase_status(scan => 'internal');
    $port->note_event(internal => $msg, scan => 'PackageMissing');
    $self->replace_phase_log(scan => $msg);
    return;
  }

  my $scanner = $Magus::Config{ClamAVScanner} || 'clamscan';
  my @options = $self->command_options(ClamAVOptions => 'ClamAV');
  my ($exit, $out) = $self->run_command($scanner, @options, $pkgfile);
  my $log = "== ClamAV package scan ==\n$out";
  my $status = 'pass';

  if ($exit == 0) {
    $port->note_event(info => "Virus scan passed.", scan => 'VirusScanClean');
  } elsif ($exit == 1) {
    $status = 'fail';
    $port->note_event(fail => "Virus scan found a problem.", scan => 'VirusScanFailed');
  } else {
    $status = 'internal';
    $port->note_event(internal => "Virus scanner exited with $exit.", scan => 'VirusScanError');
  }

  my ($yara_exit, $yara_out) = $self->run_yara_scan;
  $log .= "\n== YARA port-file scan ==\n$yara_out";

  if ($yara_exit == 0) {
    $port->note_event(info => "YARA scan passed.", scan => 'YaraScanClean');
  } elsif ($yara_exit == 1) {
    $status = 'warn' if $status eq 'pass';
    $port->note_event(warn => "YARA found suspicious port shell content.", scan => 'YaraSuspiciousShell');
  } else {
    $status = 'internal' if $status eq 'pass' || $status eq 'warn';
    $port->note_event(internal => "YARA scanner exited with $yara_exit.", scan => 'YaraScanError');
  }

  my ($integrity_exit, $integrity_out, $integrity_warnings) = $self->run_source_integrity_scan;
  $log .= "\n== Source integrity scan ==\n$integrity_out";

  if ($integrity_exit == 0) {
    if (@$integrity_warnings) {
      $status = 'warn' if $status eq 'pass';
      foreach my $warning (@$integrity_warnings) {
        $port->note_event(warn => $warning->{msg}, scan => $warning->{name});
      }
    } else {
      $port->note_event(info => "Source integrity scan passed.", scan => 'SourceIntegrityClean');
    }
  } else {
    $status = 'internal' if $status eq 'pass' || $status eq 'warn';
    $port->note_event(internal => "Source integrity scanner exited with $integrity_exit.", scan => 'SourceIntegrityError');
  }

  $port->set_phase_status(scan => $status);
  $self->replace_phase_log(scan => $log);
}

sub run_yara_scan {
  my ($self) = @_;

  my @targets = $self->yara_scan_targets;
  return (0, "No matching port files to scan.\n") unless @targets;

  my $rules = $Magus::Config{YaraRules}
    || "$Magus::Config{SlaveMportsDir}/Tools/magus/yara/mports-shell.yar";

  return (2, "YARA rules file is missing: $rules\n") unless -f $rules;

  my $scanner = $Magus::Config{YaraScanner} || 'yara';
  my @options = $self->command_options(YaraOptions => 'YARA');

  my ($exit, $out) = $self->run_command($scanner, @options, $rules, @targets);
  return ($exit, $out) if $exit != 0;
  return length($out) ? (1, $out) : (0, "No YARA matches.\n");
}

sub run_source_integrity_scan {
  my ($self) = @_;

  my $origin = $self->{port}->origin;
  my $origin_rel = $self->port_origin_relative($origin)
    or return (0, "Port origin is outside the ports tree: $origin\n", []);

  my ($history_base, $history_head, $history_msg) = $self->source_integrity_history_range($origin_rel);
  return (0, $history_msg, []) unless defined $history_base && defined $history_head;

  my ($changed_exit, $changed_out) = $self->run_command(
    'git', '-C', $ROOT, 'diff', '--name-only', $history_base, $history_head, '--', $origin_rel,
  );
  return (0, "Unable to read git history for $origin_rel: $changed_out\n", [])
    if $changed_exit != 0;

  my @changed_files = grep { length } split(/\n/, $changed_out);
  return (0, "No port-local changes in git history.\n", []) unless @changed_files;

  my ($diff_exit, $makefile_diff) = $self->run_command(
    'git', '-C', $ROOT, 'diff', '-U0', $history_base, $history_head, '--', "$origin_rel/Makefile",
  );
  $makefile_diff = '' if $diff_exit != 0;

  my $version_changed = $self->makefile_diff_changes_vars(
    $makefile_diff, qw(PORTVERSION DISTVERSION PORTREVISION)
  );
  my @warnings;

  if ($self->makefile_diff_changes_var_prefixes($makefile_diff, 'MASTER_SITES')) {
    push @warnings, {
      name => 'SourceIntegrityMasterSitesChanged',
      msg  => 'MASTER_SITES changed in git history; review upstream source location.',
    };
  }

  push @warnings, @{$self->source_domain_warnings};

  if (grep { $_ eq "$origin_rel/distinfo" } @changed_files) {
    if (!$version_changed) {
      push @warnings, {
        name => 'SourceIntegrityDistinfoWithoutVersionChange',
        msg  => 'distinfo changed without a PORTVERSION, DISTVERSION, or PORTREVISION change.',
      };
    }
  }

  if ($self->makefile_diff_changes_vars($makefile_diff, 'DIST_SUBDIR')) {
    push @warnings, {
      name => 'SourceIntegrityDistSubdirChanged',
      msg  => $version_changed
        ? 'DIST_SUBDIR changed in git history; review distfile namespace change.'
        : 'DIST_SUBDIR changed without a PORTVERSION, DISTVERSION, or PORTREVISION change.',
    };
  }

  my $use_github = $self->make_var('USE_GITHUB');
  if (length $use_github) {
    my $gh_tagname = $self->make_var('GH_TAGNAME');
    if (length $gh_tagname && !$self->looks_immutable_git_ref($gh_tagname)) {
      push @warnings, {
        name => 'SourceIntegrityMutableGithubTag',
        msg  => "USE_GITHUB resolves to non-immutable-looking GH_TAGNAME: $gh_tagname",
      };
    }
  }

  if ($self->makefile_diff_changes_var_prefixes($makefile_diff, 'GH_TAGNAME')) {
    push @warnings, {
      name => 'SourceIntegrityGithubTagChanged',
      msg  => 'GH_TAGNAME changed in git history; verify the referenced GitHub source did not move unexpectedly.',
    };
  }

  my $out = "Compared $origin_rel between $history_base and $history_head.\n";
  $out .= "Changed files:\n" . join('', map { "  $_\n" } @changed_files);
  if (@warnings) {
    $out .= "Warnings:\n" . join('', map { "  $_->{name}: $_->{msg}\n" } @warnings);
  } else {
    $out .= "No source integrity warnings.\n";
  }

  return (0, $out, \@warnings);
}

sub source_integrity_history_range {
  my ($self, $origin_rel) = @_;

  my ($log_exit, $log_out) = $self->run_command(
    'git', '-C', $ROOT, 'log', '--format=%H', '-n', '2', '--', $origin_rel,
  );
  return (undef, undef, "Unable to read git history for $origin_rel: $log_out\n")
    if $log_exit != 0;

  my @commits = grep { /\A[0-9a-f]{40}\z/i } split(/\n/, $log_out);
  return (undef, undef, "No git history available for $origin_rel; source integrity checks skipped.\n")
    unless @commits;

  my $head = $commits[0];
  my $base = $commits[1];

  if (!$base) {
    my ($parent_exit, $parent_out) = $self->run_command(
      'git', '-C', $ROOT, 'rev-parse', '--verify', "$head^",
    );
    return (undef, undef, "No parent commit available for $origin_rel; source integrity checks skipped.\n")
      if $parent_exit != 0;
    chomp($parent_out);
    $base = $parent_out if $parent_out =~ /\A[0-9a-f]{40}\z/i;
  }

  return ($base, $head, undef) if defined $base;
  return (undef, undef, "No comparison commit available for $origin_rel; source integrity checks skipped.\n");
}

sub port_origin_relative {
  my ($self, $origin) = @_;

  return unless defined $origin && index($origin, "$ROOT/") == 0;
  return substr($origin, length($ROOT) + 1);
}

sub makefile_diff_changes_vars {
  my ($self, $diff, @vars) = @_;

  return unless defined $diff && length $diff;

  my $var_re = join('|', map { quotemeta } @vars);
  foreach my $line (split(/\n/, $diff)) {
    next unless $line =~ /^[+-](?![+-])/;
    return 1 if $line =~ /^[+-][ \t]*(?:$var_re)(?:[+?:!]?=|\b)/;
  }

  return;
}

sub makefile_diff_changes_var_prefixes {
  my ($self, $diff, @prefixes) = @_;

  return unless defined $diff && length $diff;

  my $prefix_re = join('|', map { quotemeta } @prefixes);
  foreach my $line (split(/\n/, $diff)) {
    next unless $line =~ /^[+-](?![+-])/;
    return 1 if $line =~ /^[+-][ \t]*(?:$prefix_re)(?:_[A-Za-z0-9_]+)?(?:[+?:!]?=|\b)/;
  }

  return;
}

sub looks_immutable_git_ref {
  my ($self, $ref) = @_;

  return unless defined $ref;
  return $ref =~ /\A[0-9a-f]{40}\z/i || $ref =~ /\A[0-9a-f]{64}\z/i;
}

sub source_domain_warnings {
  my ($self) = @_;

  my @domains = $self->master_site_domains;
  return [] unless @domains;

  my @warnings;
  my $allowlist = $self->source_domain_allowlist;
  if ($allowlist) {
    foreach my $domain (@domains) {
      next if $self->domain_is_allowlisted($domain, $allowlist);
      push @warnings, {
        name => 'SourceIntegrityUnknownMasterSiteDomain',
        msg  => "MASTER_SITES contains domain not in source allowlist: $domain",
      };
    }
  }

  if ($Magus::Config{SourceDomainQuad9Check}) {
    foreach my $domain (@domains) {
      my $blocked = $self->quad9_blocks_domain($domain);
      next unless defined $blocked && $blocked;
      push @warnings, {
        name => 'SourceIntegrityQuad9BlockedDomain',
        msg  => "Quad9 malware-blocking resolver blocks MASTER_SITES domain: $domain",
      };
    }
  }

  return \@warnings;
}

sub master_site_domains {
  my ($self) = @_;

  my $master_sites = $self->make_var('MASTER_SITES');
  return unless length $master_sites;

  my %seen;
  my @domains;
  while ($master_sites =~ m{(?:https?|ftp)://([^/\s:]+)}ig) {
    my $domain = lc $1;
    $domain =~ s/\.$//;
    next unless $domain =~ /\A[A-Za-z0-9.-]+\z/;
    next if $seen{$domain}++;
    push @domains, $domain;
  }

  return sort @domains;
}

sub source_domain_allowlist {
  my ($self) = @_;

  return $self->{source_domain_allowlist} if exists $self->{source_domain_allowlist};

  my $path = $Magus::Config{SourceDomainAllowlist};
  return $self->{source_domain_allowlist} = undef unless defined $path && length $path && -f $path;

  open(my $fh, '<', $path) or return $self->{source_domain_allowlist} = undef;
  my %allow;
  while (my $line = <$fh>) {
    chomp($line);
    $line =~ s/#.*//;
    $line =~ s/^\s+//;
    $line =~ s/\s+$//;
    next unless length $line;
    $line = lc $line;
    $line =~ s/^\.+//;
    $line =~ s/\.+$//;
    next unless $line =~ /\A[A-Za-z0-9.-]+\z/;
    $allow{$line} = 1;
  }
  close($fh);

  return $self->{source_domain_allowlist} = \%allow;
}

sub domain_is_allowlisted {
  my ($self, $domain, $allowlist) = @_;

  return unless defined $domain && $allowlist;
  $domain = lc $domain;

  foreach my $entry (keys %$allowlist) {
    return 1 if $domain eq $entry || $domain =~ /\.\Q$entry\E\z/;
  }

  return;
}

sub quad9_blocks_domain {
  my ($self, $domain) = @_;

  my $secured = $Magus::Config{SourceDomainQuad9Resolver} || '9.9.9.9';
  my $unfiltered = $Magus::Config{SourceDomainUnfilteredResolver} || '9.9.9.10';

  my $secured_result = $self->dns_query_a($domain, $secured);
  my $unfiltered_result = $self->dns_query_a($domain, $unfiltered);

  return unless $secured_result->{ok} && $unfiltered_result->{ok};
  return 1 if $secured_result->{rcode} == 3
           && $unfiltered_result->{rcode} == 0
           && $unfiltered_result->{ancount} > 0;

  return;
}

sub dns_query_a {
  my ($self, $domain, $resolver) = @_;

  return { ok => 0 } unless defined $domain && $domain =~ /\A[A-Za-z0-9.-]+\z/;
  return { ok => 0 } unless defined $resolver && $resolver =~ /\A[0-9.]+\z/;

  my $timeout = $Magus::Config{SourceDomainDNSTimeout} || 2;
  my $id = int(rand(65536));
  my $packet = pack('n n n n n n', $id, 0x0100, 1, 0, 0, 0);
  foreach my $label (split(/\./, $domain)) {
    return { ok => 0 } if length($label) > 63;
    $packet .= pack('C', length($label)) . $label;
  }
  $packet .= "\0" . pack('n n', 1, 1);

  my $sock = IO::Socket::INET->new(
    PeerAddr => $resolver,
    PeerPort => 53,
    Proto    => 'udp',
    Timeout  => $timeout,
  ) or return { ok => 0 };

  $sock->send($packet) or return { ok => 0 };

  my $rin = '';
  vec($rin, fileno($sock), 1) = 1;
  return { ok => 0 } unless select($rin, undef, undef, $timeout) > 0;

  my $response = '';
  $sock->recv($response, 512);
  return { ok => 0 } unless length($response) >= 12;

  my ($rid, $flags, $qdcount, $ancount) = unpack('n n n n', substr($response, 0, 8));
  return { ok => 0 } unless $rid == $id;

  return {
    ok      => 1,
    rcode   => $flags & 0x000f,
    ancount => $ancount,
  };
}

sub yara_scan_targets {
  my ($self) = @_;

  my $origin = $self->{port}->origin;
  return unless -d $origin;

  my %seen;
  my @targets;

  foreach my $dir ($origin, "$origin/files") {
    next unless -d $dir;

    opendir(my $dh, $dir) or next;
    while (defined(my $entry = readdir($dh))) {
      next if $entry eq '.' || $entry eq '..';
      my $path = "$dir/$entry";
      next unless -f $path;
      next unless $self->is_yara_scan_candidate($origin, $path);
      push @targets, $path unless $seen{$path}++;
    }
    closedir($dh);
  }

  return sort @targets;
}

sub is_yara_scan_candidate {
  my ($self, $origin, $path) = @_;

  return unless index($path, "$origin/") == 0;

  my $relative = substr($path, length($origin) + 1);
  my $base = basename($path);

  return 1 if $relative =~ m{^(?:Makefile|pkg-install|pkg-deinstall|pkg-message)$};
  return 1 if $relative =~ m{^files/(?:pkg-install|pkg-deinstall|pkg-message)(?:\..*)?$};
  return 1 if $relative =~ m{^(?:files/)?[^/]+\.(?:pl|pm|py|js|mjs|cjs)$};
  return 1 if $relative =~ m{^files/patch-};
  return 1 if $base =~ m{^patch-};

  return;
}
    
sub upload_pkgfile {
  my ($self) = @_;
  my ($port, $chroot) = ($self->{port}, $self->{chroot});
  my $run  = $port->run->id;

  my $file = sprintf("%s-%s.%s", $port->pkgname, $port->version, $Magus::Config{'PkgExtension'});
  my $from = join('/', $chroot->root, $chroot->packages, 'All', $file);
  
  my $dest = "$Magus::Config{'PkgfilesRoot'}/$run/$file";

  $self->log->debug("uploading: $run/$file");
  
  my ($exit, $out) = $self->run_command('/usr/bin/scp', $from, $dest);

  if ($exit != 0 ) {
     die "scp returned non-zero: $out\n";
  }
}

sub upload_distfiles {
  my ($self) = @_;
  my ($port, $chroot) = ($self->{port}, $self->{chroot});
  my $run  = $port->run->id;

  foreach my $distfile ($port->distfiles) {
    my $file = $self->distfile_cache_path($distfile->filename) or next;
    my $from = join('/', $chroot->root, $chroot->distfiles, $file);
    my $dest = "$Magus::Config{'DistfilesRoot'}/$run/$file";
    if (-e $dest) {
      $self->log->debug("upload skipped, already present: $run/$file");
      next;
    }
    $self->ensure_parent_dir($dest);

    $self->log->debug("uploading: $run/$file");

    my ($exit, $out) = $self->run_command('/usr/bin/scp', $from, $dest);

    if ($exit != 0 ) {
      $self->log->debug("upload failed: $run/$file $out");
    }
  }
}

sub ensure_parent_dir {
  my ($self, $path) = @_;

  my $dir = dirname($path);
  mkpath($dir) unless -d $dir;
  die "Couldn't create $dir: $!\n" unless -d $dir;
}

sub replace_phase_log {
  my ($self, $phase, $data) = @_;

  Magus::PhaseLog->search(port => $self->port, phase => $phase)->delete_all;
  Magus::PhaseLog->insert({ port => $self->port, phase => $phase, data => $data });
}

sub distfile_cache_path {
  my ($self, $file) = @_;

  return unless defined $file;

  $file =~ s/:[A-Za-z0-9_,]+$//;
  $file =~ s/\?.*$//;

  if ($file =~ m{(?:^|/)\.\.(?:/|$)} || $file =~ m{^/}) {
    $self->log->err("Unsafe distfile path ignored: $file");
    return;
  }

  my $subdir = $self->distfile_subdir;
  return join('/', $subdir, $file) if length $subdir && $file !~ m{^\Q$subdir\E/};
  return $file;
}

sub distfile_subdir {
  my ($self) = @_;

  return $self->{distfile_subdir} if defined $self->{distfile_subdir};

  my @cmd = ($MAKE, '-C', $self->{port}->origin, '-V', 'DIST_SUBDIR');
  my $flavor = $self->{port}->flavor;
  push @cmd, "FLAVOR=$flavor" if defined $flavor && length $flavor;

  my ($exit, $out) = $self->run_command(@cmd);
  chomp($out);

  if ($exit != 0) {
    $self->log->debug("Unable to determine DIST_SUBDIR for $self->{port}: $out");
    return $self->{distfile_subdir} = '';
  }

  if ($out =~ /[[:cntrl:]]/) {
    $self->log->err("Unsafe DIST_SUBDIR ignored for $self->{port}: $out");
    return $self->{distfile_subdir} = '';
  }

  if ($out =~ m{(?:^|/)\.\.(?:/|$)} || $out =~ m{^/}) {
    $self->log->err("Unsafe DIST_SUBDIR ignored for $self->{port}: $out");
    return $self->{distfile_subdir} = '';
  }

  return $self->{distfile_subdir} = $out;
}

sub make_var {
  my ($self, $var) = @_;

  die "Invalid make variable name: $var\n" unless defined($var) && $var =~ /\A[A-Za-z0-9_]+\z/;

  my @cmd = ($MAKE, '-C', $self->{port}->origin, '-V', $var);
  my $flavor = $self->{port}->flavor;
  push @cmd, "FLAVOR=$flavor" if defined $flavor && length $flavor;

  my ($exit, $out) = $self->run_command(@cmd);
  return '' if $exit != 0;

  chomp($out);
  return '' if $out =~ /[[:cntrl:]]/;
  return $out;
}

sub scanner_options {
  my ($self) = @_;

  return $self->command_options(ClamAVOptions => 'ClamAV');
}

sub command_options {
  my ($self, $config_key, $label) = @_;

  my $options = $Magus::Config{$config_key};
  return unless defined $options && length $options;

  my @args = ref($options) eq 'ARRAY' ? @$options : shellwords($options);
  foreach my $arg (@args) {
    die "Invalid $label option contains a control character.\n"
      if !defined($arg) || $arg =~ /[[:cntrl:]]/;
  }

  return @args;
}

sub run_command {
  my ($self, @cmd) = @_;

  foreach my $arg (@cmd) {
    die "Invalid command argument contains a control character.\n"
      if !defined($arg) || $arg =~ /[[:cntrl:]]/;
  }

  my $err = gensym;
  my $pid = open3(undef, my $out_fh, $err, @cmd);
  my $selector = IO::Select->new($out_fh, $err);
  my $out = '';

  while (my @ready = $selector->can_read) {
    foreach my $fh (@ready) {
      my $buf = '';
      my $read = sysread($fh, $buf, 8192);
      if ($read) {
        $out .= $buf;
      } else {
        $selector->remove($fh);
        close($fh);
      }
    }
  }

  waitpid($pid, 0);

  return ($? >> 8, $out);
}

sub log {
  return $_[0]->{logger};
}    

sub port {
  return $_[0]->{port};
}
                                   

1;
__END__
