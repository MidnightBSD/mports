#!/usr/local/bin/perl

use v5.40;
use strict;
use warnings;

use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use Scalar::Util qw(looks_like_number);
use JSON::XS;
use CGI qw(-no_xhtml);

#
# Inject AbstractSearch into Magus::DBI so we can use search_where()
# for flexible port name matching.
#
{
    package Magus::DBI;
    use Class::DBI::AbstractSearch;
}

my $json = JSON::XS->new->utf8->allow_nonref->allow_blessed->canonical;
my $cgi  = CGI->new;

# Only accept POST for JSON-RPC; everything else gets a 405.
unless ($cgi->request_method eq 'POST') {
    print $cgi->header(
        -type   => 'application/json',
        -status => '405 Method Not Allowed',
    );
    print $json->encode({
        jsonrpc => '2.0',
        id      => undef,
        error   => { code => -32600, message => 'Use POST with a JSON-RPC 2.0 body' },
    });
    exit;
}

# CGI->new already consumed STDIN; for non-form content types it stashes
# the raw body in POSTDATA instead of parsing it as form fields.
my $body = $cgi->param('POSTDATA') // '';

unless (length $body) {
    rpc_error(undef, -32700, 'Parse error: empty request body');
    exit;
}

my $req;
eval { $req = $json->decode($body) };
if ($@ || !ref $req) {
    rpc_error(undef, -32700, "Parse error: $@");
    exit;
}

my $id     = $req->{id};          # undef for notifications
my $method = $req->{method} // '';
my $params = $req->{params}  // {};

# Dispatch.
if ($method eq 'initialize') {
    handle_initialize($id, $params);

} elsif ($method eq 'notifications/initialized') {
    # Notification — no JSON-RPC response; just acknowledge with HTTP 202.
    print $cgi->header(-type => 'application/json', -status => '202 Accepted');
    print '{}';

} elsif ($method eq 'tools/list') {
    handle_tools_list($id);

} elsif ($method eq 'tools/call') {
    handle_tools_call($id, $params);

} else {
    rpc_error($id, -32601, "Method not found: $method");
}

exit;

# ---------------------------------------------------------------------------
# MCP protocol handlers
# ---------------------------------------------------------------------------

sub handle_initialize($id, $params) {
    rpc_result($id, {
        protocolVersion => '2024-11-05',
        capabilities    => { tools => {} },
        serverInfo      => { name => 'magus-mcp', version => '1.0.0' },
        instructions    =>
            'Magus is the MidnightBSD package build cluster. '
          . 'Use these tools to look up port build results, run statistics, '
          . 'and build logs to help analyze failures across CPU architectures.',
    });
}

sub handle_tools_list($id) {
    rpc_result($id, { tools => [
        {
            name        => 'lookup_port',
            description =>
                'Look up the latest build results for a port by name or origin '
              . '(e.g. "www/apache24" or "apache24") across all CPU architectures. '
              . 'Returns port IDs that can be used with get_port_log or get_port_details.',
            inputSchema => {
                type       => 'object',
                properties => {
                    name => {
                        type        => 'string',
                        description =>
                            'Port origin path (e.g. "www/apache24", "devel/git") '
                          . 'or a bare port name substring (e.g. "apache24").',
                    },
                },
                required => ['name'],
            },
        },
        {
            name        => 'get_run_stats',
            description =>
                'Get metadata and package statistics (pass/fail/skip/untested counts) '
              . 'for a specific build run. If run_id is omitted, returns stats for '
              . 'the latest complete blessed run per architecture.',
            inputSchema => {
                type       => 'object',
                properties => {
                    run_id => {
                        type        => 'integer',
                        description => 'Run ID to query. Omit to get the latest run per arch.',
                    },
                },
            },
        },
        {
            name        => 'list_runs',
            description => 'List recent Magus build runs with their metadata.',
            inputSchema => {
                type       => 'object',
                properties => {
                    limit => {
                        type        => 'integer',
                        description => 'Maximum number of runs to return (default: 20, max: 100).',
                    },
                    status => {
                        type        => 'string',
                        description => 'Filter by run status: active, complete, or pending.',
                    },
                    arch => {
                        type        => 'string',
                        description => 'Filter by CPU architecture (e.g. "amd64", "aarch64").',
                    },
                },
            },
        },
        {
            name        => 'get_port_log',
            description =>
                'Retrieve the build log for a specific port by its port ID. '
              . 'Useful for analyzing build failures. Large logs are truncated to '
              . 'the final 100 KB (where the failure usually appears).',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The port ID (obtain via lookup_port or get_port_details).',
                    },
                },
                required => ['port_id'],
            },
        },
        {
            name        => 'get_port_details',
            description =>
                'Get full details for a port: metadata, build events, dependencies, '
              . 'and reverse-dependency count. Use this before fetching a log to '
              . 'confirm the port ID and understand the dependency chain.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The port ID.',
                    },
                },
                required => ['port_id'],
            },
        },
    ]});
}

sub handle_tools_call($id, $params) {
    my $name = $params->{name}      // '';
    my $args = $params->{arguments} // {};

    my %dispatch = (
        lookup_port      => \&tool_lookup_port,
        get_run_stats    => \&tool_get_run_stats,
        list_runs        => \&tool_list_runs,
        get_port_log     => \&tool_get_port_log,
        get_port_details => \&tool_get_port_details,
    );

    if (my $handler = $dispatch{$name}) {
        eval { $handler->($id, $args) };
        if ($@) {
            tool_result($id, "Internal error: $@", 1);
        }
    } else {
        rpc_error($id, -32602, "Unknown tool: $name");
    }
}

# ---------------------------------------------------------------------------
# Tool implementations
# ---------------------------------------------------------------------------

sub tool_lookup_port($id, $args) {
    my $name = $args->{name} // '';
    $name =~ s/[^\w\/.\-+]//g;    # strip anything that isn't a valid port name char

    unless ($name) {
        return tool_result($id, "Error: 'name' parameter is required and must not be empty.", 1);
    }

    # Gather the latest complete+blessed run per (arch, osversion).
    # Fall back to complete (unblessed) runs if nothing blessed exists.
    my @candidate_runs = _latest_runs_per_arch();

    unless (@candidate_runs) {
        return tool_result($id, "No completed build runs found in Magus.", 0);
    }

    my @results;
    for my $run (@candidate_runs) {
        my @ports;
        if ($name =~ m|/|) {
            # Exact origin like "www/apache24"
            @ports = Magus::Port->search(run => $run->id, name => $name,
                { order_by => 'name' });
        } else {
            # Partial: match "category/name" suffix or substring
            @ports = Magus::Port->search_where(
                { run => $run->id, name => { like => "%/$name" } },
                { order_by => 'name' },
            );
            # Broaden to substring if no suffix match
            unless (@ports) {
                @ports = Magus::Port->search_where(
                    { run => $run->id, name => { like => "%$name%" } },
                    { order_by => 'name' },
                );
            }
        }

        for my $port (@ports) {
            push @results, {
                port_id   => $port->id   + 0,
                name      => $port->name,
                pkgname   => $port->pkgname,
                version   => $port->version // '',
                status    => $port->status,
                flavor    => $port->flavor // '',
                arch      => $run->arch,
                osversion => $run->osversion,
                run_id    => $run->id    + 0,
                blessed   => $run->blessed ? 1 : 0,
            };
        }
    }

    unless (@results) {
        return tool_result($id,
            "No results found for '$name'. "
          . "Try using the full origin path (e.g. 'www/apache24') or a different substring.",
            0);
    }

    my $text = "Build results for '$name' (latest blessed runs per arch):\n\n";
    for my $r (sort { $a->{arch} cmp $b->{arch} || $a->{name} cmp $b->{name} } @results) {
        $text .= sprintf(
            "  %-30s  status=%-9s  arch=%-8s  os=%-6s  version=%s\n",
            $r->{name}, $r->{status}, $r->{arch}, $r->{osversion}, $r->{version},
        );
        $text .= sprintf(
            "    port_id=%-6d  run_id=%-6d  pkgname=%s%s\n",
            $r->{port_id}, $r->{run_id}, $r->{pkgname},
            ($r->{flavor} ? "  flavor=$r->{flavor}" : ''),
        );
    }
    $text .= "\nUse get_port_log with a port_id to retrieve the build log for failures.";

    tool_result($id, $text, 0);
}

sub tool_get_run_stats($id, $args) {
    my @runs;

    if (defined $args->{run_id} && is_number($args->{run_id})) {
        my $run = eval { Magus::Run->retrieve(int($args->{run_id})) };
        return tool_result($id, "Run ID $args->{run_id} not found.", 1) unless $run;
        push @runs, $run;
    } else {
        @runs = _latest_runs_per_arch();
        return tool_result($id, "No completed build runs found.", 0) unless @runs;
    }

    my $dbh  = Magus::DBI->db_Main();
    my $text = '';

    for my $run (@runs) {
        my $sth = $dbh->prepare(
            'SELECT COUNT(*) AS count, status FROM ports WHERE run=? GROUP BY status ORDER BY status'
        );
        $sth->execute($run->id);
        my $rows = $sth->fetchall_arrayref({});
        $sth->finish;

        my %c = map { $_->{status} => $_->{count} + 0 } @$rows;
        my $total = 0;
        $total += $_ for values %c;

        $text .= sprintf(
            "Run %d\n  arch=%-8s  osversion=%-6s  status=%-10s  blessed=%s\n  created=%s\n",
            $run->id, $run->arch, $run->osversion, $run->status,
            ($run->blessed ? 'yes' : 'no'), $run->created,
        );
        $text .= sprintf(
            "  Packages: total=%-5d  pass=%-5d  fail=%-5d  skip=%-5d  warn=%-5d  untested=%d\n\n",
            $total,
            $c{pass}     // 0,
            $c{fail}     // 0,
            $c{skip}     // 0,
            $c{warn}     // 0,
            $c{untested} // 0,
        );
    }

    tool_result($id, $text, 0);
}

sub tool_list_runs($id, $args) {
    my $limit = $args->{limit} // 20;
    $limit = 20 unless is_number($limit);
    $limit = int($limit);
    $limit = 1   if $limit < 1;
    $limit = 100 if $limit > 100;

    my %filter;
    $filter{status} = $args->{status}
        if defined $args->{status} && $args->{status} =~ /^\w+$/;
    $filter{arch}   = $args->{arch}
        if defined $args->{arch}   && $args->{arch}   =~ /^\w+$/;

    my @runs = Magus::Run->search(%filter, { order_by => 'id DESC' });
    @runs = @runs[0 .. $limit - 1] if @runs > $limit;

    return tool_result($id, "No runs found matching the given criteria.", 0) unless @runs;

    my $text = sprintf("%-6s  %-8s  %-6s  %-10s  %-7s  %s\n",
        'Run', 'Arch', 'OS', 'Status', 'Blessed', 'Created');
    $text .= '-' x 60 . "\n";

    for my $run (@runs) {
        $text .= sprintf("%-6d  %-8s  %-6s  %-10s  %-7s  %s\n",
            $run->id, $run->arch, $run->osversion, $run->status,
            ($run->blessed ? 'yes' : 'no'), $run->created);
    }

    tool_result($id, $text, 0);
}

sub tool_get_port_log($id, $args) {
    unless (defined $args->{port_id} && is_number($args->{port_id})) {
        return tool_result($id, "Error: 'port_id' must be a valid integer.", 1);
    }

    my $port_id = int($args->{port_id});
    my $port = eval { Magus::Port->retrieve($port_id) };
    return tool_result($id, "Port ID $port_id not found.", 1) unless $port;

    my $log = $port->log;
    unless (defined $log && length $log) {
        return tool_result($id,
            sprintf(
                "No build log available for %s (port_id=%d, status=%s, arch=%s, run=%d).",
                $port->name, $port->id, $port->status, $port->run->arch, $port->run->id,
            ), 0);
    }

    # Keep the tail of the log where failures appear; LLMs have finite context.
    my $max_bytes = 100 * 1024;
    my $truncated = length($log) > $max_bytes;
    $log = substr($log, -$max_bytes) if $truncated;

    my $header = sprintf(
        "Build log for %s\n  port_id=%d  status=%s  arch=%s  osversion=%s  run=%d\n",
        $port->name, $port->id, $port->status,
        $port->run->arch, $port->run->osversion, $port->run->id,
    );
    $header .= "[NOTE: log truncated — showing final 100 KB where failures appear]\n"
        if $truncated;
    $header .= "---\n";

    tool_result($id, $header . $log, 0);
}

sub tool_get_port_details($id, $args) {
    unless (defined $args->{port_id} && is_number($args->{port_id})) {
        return tool_result($id, "Error: 'port_id' must be a valid integer.", 1);
    }

    my $port_id = int($args->{port_id});
    my $port = eval { Magus::Port->retrieve($port_id) };
    return tool_result($id, "Port ID $port_id not found.", 1) unless $port;

    my $text = sprintf("Port: %s\n", $port->name);
    $text .= sprintf("  port_id:     %d\n",   $port->id);
    $text .= sprintf("  pkgname:     %s\n",   $port->pkgname);
    $text .= sprintf("  version:     %s\n",   $port->version  // '');
    $text .= sprintf("  status:      %s\n",   $port->status);
    $text .= sprintf("  flavor:      %s\n",   $port->flavor   // '');
    $text .= sprintf("  arch:        %s\n",   $port->run->arch);
    $text .= sprintf("  osversion:   %s\n",   $port->run->osversion);
    $text .= sprintf("  run_id:      %d\n",   $port->run->id);
    $text .= sprintf("  description: %s\n",   $port->description // '');
    $text .= sprintf("  www:         %s\n",   $port->www         // '');
    $text .= sprintf("  license:     %s\n",   $port->license     // '');
    $text .= sprintf("  cpe:         %s\n",   $port->cpe         // '');

    # Build events (failures, warnings, info messages)
    my @events = $port->events;
    if (@events) {
        $text .= "\nBuild events:\n";
        for my $ev (@events) {
            $text .= sprintf("  [%s] type=%-10s  %s\n",
                $ev->time // '?', $ev->type // '?', $ev->msg // '');
        }
    } else {
        $text .= "\nNo build events recorded.\n";
    }

    # Direct dependencies
    my @deps = Magus::Depend->search(port => $port->id, { order_by => 'type, dependency' });
    if (@deps) {
        $text .= sprintf("\nDependencies (%d):\n", scalar @deps);
        for my $dep (@deps) {
            my $d = $dep->dependency;
            $text .= sprintf("  [%-8s] %-35s  status=%-9s  port_id=%d\n",
                $dep->type, $d->name, $d->status, $d->id);
        }
    } else {
        $text .= "\nNo dependencies.\n";
    }

    # Reverse dependencies (ports that need this one)
    my @rdeps = Magus::Depend->search(dependency => $port->id);
    if (@rdeps) {
        my $shown_max = 20;
        $text .= sprintf("\nRequired by (%d port%s):\n",
            scalar @rdeps, @rdeps == 1 ? '' : 's');
        my $shown = 0;
        for my $rdep (@rdeps) {
            last if $shown >= $shown_max;
            my $p = $rdep->port;
            $text .= sprintf("  %-35s  status=%-9s  port_id=%d\n",
                $p->name, $p->status, $p->id);
            $shown++;
        }
        $text .= sprintf("  ... and %d more\n", scalar(@rdeps) - $shown_max)
            if @rdeps > $shown_max;
    }

    tool_result($id, $text, 0);
}

# ---------------------------------------------------------------------------
# Internal helpers
# ---------------------------------------------------------------------------

# Returns the most recent complete+blessed run per (arch, osversion).
# Falls back to any complete run if no blessed runs exist.
sub _latest_runs_per_arch() {
    my %seen;
    my @result;

    for my $run (Magus::Run->search(
            status  => 'complete',
            blessed => 1,
            { order_by => 'created DESC, osversion DESC, arch' })) {
        my $key = $run->arch . '-' . $run->osversion;
        next if $seen{$key}++;
        push @result, $run;
    }

    # If no blessed runs at all, fall back to unblessed complete runs.
    unless (@result) {
        for my $run (Magus::Run->search(
                status => 'complete',
                { order_by => 'created DESC, osversion DESC, arch' })) {
            my $key = $run->arch . '-' . $run->osversion;
            next if $seen{$key}++;
            push @result, $run;
        }
    }

    return @result;
}

sub is_number($n) {
    return looks_like_number($n) && $n !~ /inf|nan/i;
}

sub tool_result($id, $text, $is_error) {
    rpc_result($id, {
        content => [{ type => 'text', text => $text }],
        isError => $is_error ? \1 : \0,
    });
}

sub rpc_result($id, $result) {
    print $cgi->header(-type => 'application/json');
    print $json->encode({
        jsonrpc => '2.0',
        id      => $id,
        result  => $result,
    });
}

sub rpc_error($id, $code, $message) {
    print $cgi->header(-type => 'application/json', -status => '400 Bad Request');
    print $json->encode({
        jsonrpc => '2.0',
        id      => $id,
        error   => { code => $code + 0, message => $message },
    });
}
