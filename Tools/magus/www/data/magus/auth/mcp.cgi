#!/usr/local/bin/perl

use v5.40;
use strict;
use warnings;

use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use Scalar::Util qw(looks_like_number);
use JSON::XS;
use CGI qw(-no_xhtml);
use LWP::UserAgent;
use URI::Escape qw(uri_escape);
use YAML::Tiny;

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
my @SUPPORTED_PROTOCOL_VERSIONS = qw(2025-06-18 2025-03-26 2024-11-05);
my $collect_responses = 0;
my @collected_responses;

# Allowed LLM models for analyze_build_log
my %OLLAMA_MODELS = map { $_ => 1 } qw(
    phi4
    deepseek-coder:6.7b
    llama3.2:3b
    qwen2.5-coder:14b
    gemma4:latest
    mistral-nemo:latest
    mistral:7b
    gemma3:latest
);

my %MISTRAL_MODELS = map { $_ => 1 } qw(
    mistral-small-latest
    mistral-medium-latest
    mistral-large-latest
);

my %ALLOWED_MODELS = (%OLLAMA_MODELS, %MISTRAL_MODELS);

# GET opens a Streamable HTTP SSE channel. This server currently has no
# server-initiated messages, so emit keepalives and let the CGI request end.
if ($cgi->request_method eq 'GET') {
    unless (accepts_content_type('text/event-stream')) {
        http_json_error('406 Not Acceptable', undef, -32600,
            'Accept header must include text/event-stream');
        exit;
    }
    handle_sse_get();
    exit;
}

# Only accept POST for JSON-RPC messages; everything else gets a 405.
unless ($cgi->request_method eq 'POST') {
    http_json_error('405 Method Not Allowed', undef, -32600,
        'Use POST with a JSON-RPC 2.0 body');
    exit;
}

unless (accepts_content_type('application/json')
    && accepts_content_type('text/event-stream')) {
    http_json_error('406 Not Acceptable', undef, -32600,
        'Accept header must include application/json and text/event-stream');
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

unless (is_initialize_request($req) || validate_mcp_protocol_header()) {
    rpc_error(undef, -32600, 'Unsupported MCP-Protocol-Version header');
    exit;
}

if (ref $req eq 'ARRAY') {
    unless (@$req) {
        rpc_error(undef, -32600, 'Invalid Request: empty batch');
        exit;
    }

    if (effective_protocol_version() eq '2025-06-18') {
        rpc_error(undef, -32600,
            'JSON-RPC batch requests are not supported for MCP 2025-06-18');
        exit;
    }

    if (batch_contains_initialize($req)) {
        rpc_error(undef, -32600, 'initialize must not be part of a JSON-RPC batch');
        exit;
    }

    @collected_responses = ();
    $collect_responses = 1;
    dispatch_request($_) for @$req;
    $collect_responses = 0;

    if (@collected_responses) {
        print json_header();
        print $json->encode(\@collected_responses);
    } else {
        print json_header(-status => '202 Accepted');
    }

} elsif (ref $req eq 'HASH') {
    dispatch_request($req);

} else {
    rpc_error(undef, -32600, 'Invalid Request');
}

exit;

# Dispatch one JSON-RPC message. In batch mode, responses are collected by
# rpc_result()/rpc_error(); notifications intentionally produce no response.
sub dispatch_request($req) {
    unless (ref $req eq 'HASH') {
        return rpc_error(undef, -32600, 'Invalid Request');
    }

    unless (defined $req->{jsonrpc} && $req->{jsonrpc} eq '2.0') {
        return rpc_error(undef, -32600, 'Invalid Request: jsonrpc must be "2.0"');
    }

    if (!exists $req->{method}) {
        return acknowledge_notification()
            if is_jsonrpc_response($req);
        return rpc_error($req->{id}, -32600, 'Invalid Request');
    }

    my $has_id = exists $req->{id};   # requests have ids; notifications do not
    my $id     = $req->{id};
    my $method = $req->{method};
    my $params = $req->{params}  // {};

    if ($method eq 'initialize') {
        return acknowledge_notification() unless $has_id;
        handle_initialize($id, $params);

    } elsif ($method eq 'notifications/initialized') {
        # Notification: acknowledge at HTTP level only; JSON-RPC notifications
        # must not receive a response body.
        acknowledge_notification();

    } elsif ($method eq 'tools/list') {
        return acknowledge_notification() unless $has_id;
        handle_tools_list($id);

    } elsif ($method eq 'tools/call') {
        return acknowledge_notification() unless $has_id;
        handle_tools_call($id, $params);

    } else {
        return acknowledge_notification() unless $has_id;
        rpc_error($id, -32601, "Method not found: $method");
    }
}

# ---------------------------------------------------------------------------
# MCP protocol handlers
# ---------------------------------------------------------------------------

sub handle_initialize($id, $params) {
    rpc_result($id, {
        protocolVersion => negotiated_protocol_version($params->{protocolVersion}),
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
              . 'Includes both blessed and unblessed complete runs. '
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
            name        => 'get_log_excerpt',
            description =>
                'Retrieve a focused excerpt from a port build log. Use pattern to '
              . 'show context around the last matching line, or tail_bytes to get '
              . 'the end of the log.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The Magus port ID.',
                    },
                    pattern => {
                        type        => 'string',
                        description => 'Literal text to search for in the log.',
                    },
                    context_lines => {
                        type        => 'integer',
                        description => 'Lines of context around the match (default: 8, max: 50).',
                    },
                    tail_bytes => {
                        type        => 'integer',
                        description => 'Bytes from the end of the log when pattern is omitted (default: 20000, max: 100000).',
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
        {
            name        => 'get_port_events',
            description =>
                'Return build events for a port, optionally filtered by type, phase, '
              . 'or machine_id.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The Magus port ID.',
                    },
                    type => {
                        type        => 'string',
                        description => 'Optional event type filter.',
                    },
                    phase => {
                        type        => 'string',
                        description => 'Optional event phase filter.',
                    },
                    machine_id => {
                        type        => 'integer',
                        description => 'Optional machine ID filter.',
                    },
                    limit => {
                        type        => 'integer',
                        description => 'Maximum events to return (default: 100, max: 500).',
                    },
                },
                required => ['port_id'],
            },
        },
        {
            name        => 'get_dependency_blockers',
            description =>
                'Walk a port dependency graph and list failed or skipped dependencies '
              . 'that are likely blocking the selected port.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The Magus port ID.',
                    },
                    max_depth => {
                        type        => 'integer',
                        description => 'Maximum dependency depth to walk (default: 8, max: 20).',
                    },
                    limit => {
                        type        => 'integer',
                        description => 'Maximum blockers to return (default: 50, max: 200).',
                    },
                },
                required => ['port_id'],
            },
        },
        {
            name        => 'get_distfiles',
            description =>
                'Return distfiles, restricted distfiles, and master sites recorded '
              . 'for a port.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The Magus port ID.',
                    },
                },
                required => ['port_id'],
            },
        },
        {
            name        => 'get_port_cves',
            description =>
                'Look up CVE information for a Magus port using the port CPE. '
              . 'Pass either port_id or a port origin/name. Uses the same '
              . 'sec.midnightbsd.org partial CPE match API as get_cves.cgi.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The Magus port ID.',
                    },
                    name => {
                        type        => 'string',
                        description =>
                            'Port origin path (e.g. "www/apache24") or bare name. '
                          . 'Used only when port_id is omitted.',
                    },
                    include_raw => {
                        type        => 'boolean',
                        description => 'Include the raw JSON returned by the CVE API.',
                    },
                },
            },
        },
        {
            name        => 'list_run_ports',
            description =>
                'List ports in a run, with filters for status, name, category, '
              . 'pkgname, and flavor.',
            inputSchema => {
                type       => 'object',
                properties => {
                    run_id => {
                        type        => 'integer',
                        description => 'Run ID to query.',
                    },
                    status => {
                        type        => 'string',
                        description => 'Optional port status filter such as fail, skip, warn, pass, or untested.',
                    },
                    name => {
                        type        => 'string',
                        description => 'Optional origin substring filter.',
                    },
                    category => {
                        type        => 'string',
                        description => 'Optional category filter such as devel or www.',
                    },
                    pkgname => {
                        type        => 'string',
                        description => 'Optional package name substring filter.',
                    },
                    flavor => {
                        type        => 'string',
                        description => 'Optional flavor filter.',
                    },
                    limit => {
                        type        => 'integer',
                        description => 'Maximum ports to return (default: 100, max: 500).',
                    },
                },
                required => ['run_id'],
            },
        },
        {
            name        => 'search_ports',
            description =>
                'Search ports across runs using filters for name, pkgname, status, '
              . 'arch, osversion, flavor, and run_id.',
            inputSchema => {
                type       => 'object',
                properties => {
                    name => {
                        type        => 'string',
                        description => 'Origin path or substring to search for.',
                    },
                    pkgname => {
                        type        => 'string',
                        description => 'Package name substring to search for.',
                    },
                    status => {
                        type        => 'string',
                        description => 'Optional port status filter.',
                    },
                    arch => {
                        type        => 'string',
                        description => 'Optional architecture filter.',
                    },
                    osversion => {
                        type        => 'string',
                        description => 'Optional OS version filter.',
                    },
                    flavor => {
                        type        => 'string',
                        description => 'Optional flavor filter.',
                    },
                    run_id => {
                        type        => 'integer',
                        description => 'Optional run ID filter.',
                    },
                    limit => {
                        type        => 'integer',
                        description => 'Maximum ports to return (default: 100, max: 500).',
                    },
                },
            },
        },
        {
            name        => 'compare_port_runs',
            description =>
                'Compare one port origin or name across two runs, showing matching '
              . 'port rows and status/version differences.',
            inputSchema => {
                type       => 'object',
                properties => {
                    name => {
                        type        => 'string',
                        description => 'Port origin path or bare name.',
                    },
                    run_id_a => {
                        type        => 'integer',
                        description => 'First run ID.',
                    },
                    run_id_b => {
                        type        => 'integer',
                        description => 'Second run ID.',
                    },
                },
                required => ['name', 'run_id_a', 'run_id_b'],
            },
        },
        {
            name        => 'get_machine_events',
            description =>
                'Return recent build events for a specific machine in a run.',
            inputSchema => {
                type       => 'object',
                properties => {
                    run_id => {
                        type        => 'integer',
                        description => 'Run ID to query.',
                    },
                    machine_id => {
                        type        => 'integer',
                        description => 'Machine ID to query.',
                    },
                    limit => {
                        type        => 'integer',
                        description => 'Maximum events to return (default: 100, max: 500).',
                    },
                },
                required => ['run_id', 'machine_id'],
            },
        },
        {
            name        => 'top_blockers',
            description =>
                'List the highest-weight failed or skipped ports blocking other ports '
              . 'from building. The weight is an approximate priority score, not an '
              . 'exact reverse-dependency count. Higher weights should be fixed first.',
            inputSchema => {
                type       => 'object',
                properties => {
                    run_id => {
                        type        => 'integer',
                        description =>
                            'Run ID to analyze. Omit to use the latest complete blessed '
                          . 'run per architecture.',
                    },
                    limit => {
                        type        => 'integer',
                        description => 'Maximum number of blockers to return per run (default: 20, max: 100).',
                    },
                },
            },
        },
        {
            name        => 'analyze_build_log',
            description =>
                'Analyze the build log of a failed port to explain the error '
              . 'using a local LLM.',
            inputSchema => {
                type       => 'object',
                properties => {
                    port_id => {
                        type        => 'integer',
                        description => 'The port ID to analyze.',
                    },
                    model => {
                        type        => 'string',
                        description => 'The LLM to use. Default is "qwen2.5-coder:14b". Options: phi4, deepseek-coder:6.7b, llama3.2:3b, qwen2.5-coder:14b, gemma4:latest, mistral-nemo:latest, mistral:7b, gemma3:latest, mistral-small-latest, mistral-medium-latest, mistral-large-latest',
                    },
                },
                required => ['port_id'],
            },
        },
        {
            name        => 'list_port_updates',
            description =>
                'Returns a list of ports that have new versions available, '
              . 'as detected by portscout.',
            inputSchema => {
                type       => 'object',
                properties => {},
            },
        },
    ]});
}

sub handle_tools_call($id, $params) {
    my $name = $params->{name}      // '';
    my $args = $params->{arguments} // {};

    my %dispatch = (
        lookup_port       => \&tool_lookup_port,
        get_run_stats     => \&tool_get_run_stats,
        list_runs         => \&tool_list_runs,
        get_port_log      => \&tool_get_port_log,
        get_log_excerpt   => \&tool_get_log_excerpt,
        get_port_details  => \&tool_get_port_details,
        get_port_events   => \&tool_get_port_events,
        get_dependency_blockers => \&tool_get_dependency_blockers,
        get_distfiles     => \&tool_get_distfiles,
        get_port_cves     => \&tool_get_port_cves,
        list_run_ports    => \&tool_list_run_ports,
        search_ports      => \&tool_search_ports,
        compare_port_runs => \&tool_compare_port_runs,
        get_machine_events => \&tool_get_machine_events,
        top_blockers      => \&tool_top_blockers,
        analyze_build_log => \&tool_analyze_build_log,
        list_port_updates => \&tool_list_port_updates,
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

sub tool_list_port_updates($id, $args) {
    my $run_dir = '/usr/local/etc';
    my $output = '';
    my $error  = '';

    use Cwd qw(getcwd);
    my $orig_dir = getcwd();

    if (chdir($run_dir)) {
        # FastCGI environments often have issues with standard pipe opens
        # Let's try capturing using backticks instead to avoid the FCGI::Stream handle issue
        # Note: Backticks execute in a subshell, but are simpler to use in FastCGI if standard open("-|") fails.
        local %ENV = %ENV; # Localize environment just in case
        eval {
            $output = `cd $run_dir && /usr/local/bin/portscout showupdates 2>&1`;

            if ($? != 0) {
                my $exit_val = $? >> 8;
                my $signal   = $? & 127;
                $error = "portscout failed: " . ($exit_val ? "exit code $exit_val" : "signal $signal");
            }
        };
        if ($@) {
             $error = "Failed to run portscout: $@";
        }
        chdir($orig_dir);
    } else {
        $error = "Could not chdir to $run_dir: $!";
    }

    if ($error) {
        return tool_result($id, "Error fetching updates: $error\n\nOutput: $output", 1);
    }

    my @lines = split /\n/, $output;
    my $text = "Portscout Available Updates:\n\n";
    my $current_maintainer = '';
    my $updates_found = 0;

    for my $line (@lines) {
        next if $line =~ /^\s*$/;
        next if $line =~ /^portscout\s+v\d+/;

        if ($line =~ /^([^']+)'s ports:/) {
            $current_maintainer = $1;
            $text .= "\nMaintainer: $current_maintainer\n";
        } elsif ($line =~ /^\s+(\S+)\s+(\S+)\s+->\s+(\S+)/) {
            $text .= sprintf("  %-30s %-15s -> %s\n", $1, $2, $3);
            $updates_found++;
        }
    }

    if (!$updates_found) {
        $text = "No port updates currently detected by portscout.";
    }

    tool_result($id, $text, 0);
}

sub tool_analyze_build_log($id, $args) {
    unless (defined $args->{port_id} && is_number($args->{port_id})) {
        return tool_result($id, "Error: 'port_id' must be a valid integer.", 1);
    }

    my $model = "qwen2.5-coder:14b";
    if (defined $args->{model}) {
        my $requested_model = lc $args->{model};
        # some loose matching since model names are exact in ollama usually
        # fallback to what they asked if it's in the allowed list
        if ($ALLOWED_MODELS{$requested_model}) {
            $model = $requested_model;
        } elsif ($ALLOWED_MODELS{$args->{model}}) {
             $model = $args->{model};
        } else {
             return tool_result($id, "Error: Model '$args->{model}' is not supported. Try 'qwen2.5-coder:14b', 'mistral-small-latest', etc.", 1);
        }
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

    # Keep the tail of the log where failures appear
    my $max_bytes = 100 * 1024;
    my $truncated = length($log) > $max_bytes;
    $log = substr($log, -$max_bytes) if $truncated;

    my $prompt = "Please analyze this build failure for the MidnightBSD port "
               . $port->name . ".\n\n"
               . "Here is the end of the build log:\n\n" . $log;

    my $system_prompt = "Provide a technical analysis of error logs for building software applications in the MidnightBSD ports tree. MidnightBSD uses mport rather than pkg and magus rather than poudriere.";

    my $ua = LWP::UserAgent->new;
    $ua->ssl_opts(verify_hostname => 0);
    $ua->timeout(300);

    my $url;
    my $is_mistral = $MISTRAL_MODELS{$model} || 0;

    if ($is_mistral) {
        $url = 'https://api.mistral.ai/v1/chat/completions';
    } else {
        $url = 'http://llm.midnightbsd.org:11434/api/chat';
    }

    my $payload = {
        model => $model,
        messages => [
            { role => "system", content => $system_prompt },
            { role => "user", content => $prompt }
        ],
        stream => \0,
    };
    my $json_payload = $json->encode($payload);

    my $req = HTTP::Request->new('POST', $url);
    $req->header('Content-Type' => 'application/json');

    if ($is_mistral) {
        # Read configuration for API keys
        my $config_path = '/usr/magus/config.yaml';
        my $config = {};
        if (-e $config_path) {
            eval {
                $config = YAML::Tiny->read($config_path)->[0] || {};
            };
        }

        my $api_key = $config->{MistralApiKey} // '';
        unless ($api_key) {
            return tool_result($id, "Mistral API key not configured in $config_path", 1);
        }
        $req->header('User-Agent' => 'MistralPerlClient/1.0');
        $req->header('Authorization' => "Bearer $api_key");
    }

    $req->content($json_payload);

    my $response = $ua->request($req);

    if ($response->is_success) {
        my $raw_content = $response->decoded_content;
        my $data = eval { $json->decode($raw_content) };
        if ($@) {
             return tool_result($id, "Failed to parse response from llm: $@", 1);
        }

        my $analysis;
        if ($is_mistral) {
            $analysis = $data->{choices}[0]{message}{content} // "No analysis returned.";
        } else {
            $analysis = $data->{message}{content} // "No analysis returned.";
        }

        tool_result($id, "Analysis of build failure for " . $port->name . " (using model: $model):\n\n" . $analysis, 0);
    } else {

        # Fallback to fetch if https is not supported by LWP
        if ($response->status_line =~ /Protocol scheme 'https' is not supported/) {
            my $content = '';
            my $fetch_cmd = '/usr/bin/fetch';

            # We must write the payload to a temp file for fetch to POST it
            use File::Temp qw/tempfile/;
            my ($fh, $filename) = tempfile();
            print $fh $json_payload;
            close $fh;

            my @args = ($fetch_cmd, '-qo', '-', '--no-verify-peer');

            if ($is_mistral) {
                my $config_path = '/usr/magus/config.yaml';
                my $config = {};
                if (-e $config_path) {
                    eval {
                        $config = YAML::Tiny->read($config_path)->[0] || {};
                    };
                }
                my $api_key = $config->{MistralApiKey} // '';
                push @args, '--http-header', "Authorization: Bearer $api_key";
                push @args, '--http-header', "Content-Type: application/json; charset=utf-8";
            } else {
                push @args, '--http-header', "Content-Type: application/json; charset=utf-8";
            }

            # We have to trick fetch into doing a POST by giving it a data file.
            $ENV{HTTP_METHOD} = 'POST';
            push @args, '--http-header', "Content-Length: " . length($json_payload);

            my $pid = open(my $pipe, "-|");
            if (!defined $pid) {
                 unlink $filename;
                 return tool_result($id, "Failed to run fetch command for https", 1);
            }

            if ($pid == 0) {
                 # Child process
                 open(STDIN, "<", $filename) or die "Cannot redirect STDIN";
                 exec(@args, $url) or die "Cannot exec fetch";
            } else {
                 # Parent process
                 local $/;
                 $content = <$pipe> // '';
                 close $pipe;

                 # Clean up temp file
                 unlink $filename;

                 if ($? == 0 && length $content > 0) {
                      eval {
                          my $data = $json->decode($content);
                          my $analysis;
                          if ($is_mistral) {
                              $analysis = $data->{choices}[0]{message}{content} // "No analysis returned.";
                          } else {
                              $analysis = $data->{message}{content} // "No analysis returned.";
                          }
                          tool_result($id, "Analysis of build failure for " . $port->name . " (using model: $model):\n\n" . $analysis, 0);
                      };
                      if ($@) {
                          return tool_result($id, "JSON Parsing failed (fetch fallback): $@", 1);
                      }
                      return; # we handled it with fetch
                 } else {
                     return tool_result($id, "Fetch fallback failed with exit code $?", 1);
                 }
            }
        }

        tool_result($id, "Failed to call llm: " . $response->status_line, 1);
    }
}

sub tool_lookup_port($id, $args) {
    my $name = $args->{name} // '';
    $name =~ s/[^\w\/.\-+]//g;    # strip anything that isn't a valid port name char

    unless ($name) {
        return tool_result($id, "Error: 'name' parameter is required and must not be empty.", 1);
    }

    # Gather the latest complete blessed and unblessed runs per (arch, osversion).
    my @candidate_runs = _latest_lookup_runs_per_arch();

    unless (@candidate_runs) {
        return tool_result($id, "No completed build runs found in Magus.", 0);
    }

    my @results;

    # Pre-fetch the run IDs to do one large query instead of looping queries
    my @run_ids = map { $_->id } @candidate_runs;
    return tool_result($id, "No completed build runs found in Magus.", 0) unless @run_ids;

    my $dbh = Magus::DBI->db_Main();
    my $in_clause = join(',', map { '?' } @run_ids);
    my $query;
    my @bind_params;

    if ($name =~ m|/|) {
        # Exact origin like "www/apache24"
        $query = "SELECT p.*, r.arch, r.osversion, r.blessed FROM ports p JOIN runs r ON p.run = r.id WHERE p.run IN ($in_clause) AND p.name = ? ORDER BY p.name";
        @bind_params = (@run_ids, $name);
    } else {
        # Match substring
        $query = "SELECT p.*, r.arch, r.osversion, r.blessed FROM ports p JOIN runs r ON p.run = r.id WHERE p.run IN ($in_clause) AND p.name LIKE ? ORDER BY p.name";
        @bind_params = (@run_ids, "%$name%");
    }

    my $sth = $dbh->prepare($query);
    $sth->execute(@bind_params);

    while (my $row = $sth->fetchrow_hashref) {
        push @results, {
            port_id   => $row->{id} + 0,
            name      => $row->{name},
            pkgname   => $row->{pkgname},
            version   => $row->{version} // '',
            status    => $row->{status},
            flavor    => $row->{flavor} // '',
            arch      => $row->{arch},
            osversion => $row->{osversion},
            run_id    => $row->{run} + 0,
            blessed   => $row->{blessed} ? 1 : 0,
        };
    }
    $sth->finish;

    unless (@results) {
        return tool_result($id,
            "No results found for '$name'. "
          . "Try using the full origin path (e.g. 'www/apache24') or a different substring.",
            0);
    }

    my $text = "Build results for '$name' (latest complete runs per arch; blessed and unblessed):\n\n";
    for my $r (sort {
        $b->{osversion} cmp $a->{osversion}
            || $a->{arch} cmp $b->{arch}
            || $b->{blessed} <=> $a->{blessed}
            || $a->{name} cmp $b->{name}
    } @results) {
        $text .= sprintf(
            "  %-30s  status=%-9s  arch=%-8s  os=%-6s  blessed=%-3s  version=%s\n",
            $r->{name}, $r->{status}, $r->{arch}, $r->{osversion},
            ($r->{blessed} ? 'yes' : 'no'), $r->{version},
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

    # Use a single query for all runs using GROUP BY and IN clause
    my @run_ids = map { $_->id } @runs;
    if (@run_ids) {
        my $in_clause = join(',', map { '?' } @run_ids);
        my $sth = $dbh->prepare(
            "SELECT run, status, COUNT(*) AS count FROM ports WHERE run IN ($in_clause) GROUP BY run, status"
        );
        $sth->execute(@run_ids);

        my %stats;
        while (my $row = $sth->fetchrow_hashref) {
            $stats{$row->{run}}{$row->{status}} = $row->{count} + 0;
        }
        $sth->finish;

        for my $run (@runs) {
            my $run_stats = $stats{$run->id} || {};
            my $total = 0;
            $total += $_ for values %$run_stats;

            $text .= sprintf(
                "Run %d\n  arch=%-8s  osversion=%-6s  status=%-10s  blessed=%s\n  created=%s\n",
                $run->id, $run->arch, $run->osversion, $run->status,
                ($run->blessed ? 'yes' : 'no'), $run->created,
            );
            $text .= sprintf(
                "  Packages: total=%-5d  pass=%-5d  fail=%-5d  skip=%-5d  warn=%-5d  untested=%d\n\n",
                $total,
                $run_stats->{pass}     // 0,
                $run_stats->{fail}     // 0,
                $run_stats->{skip}     // 0,
                $run_stats->{warn}     // 0,
                $run_stats->{untested} // 0,
            );
        }
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

    # Fetch rows directly to avoid hydrating Class::DBI objects we don't fully need
    my $dbh = Magus::DBI->db_Main();

    my $where_clause = "";
    my @bind_params;

    if (%filter) {
        my @conditions;
        if ($filter{status}) {
            push @conditions, "status = ?";
            push @bind_params, $filter{status};
        }
        if ($filter{arch}) {
            push @conditions, "arch = ?";
            push @bind_params, $filter{arch};
        }
        $where_clause = "WHERE " . join(" AND ", @conditions);
    }

    my $sth = $dbh->prepare(
        "SELECT id, arch, osversion, status, blessed, created FROM runs $where_clause ORDER BY id DESC LIMIT ?"
    );
    push @bind_params, $limit;

    $sth->execute(@bind_params);
    my $runs = $sth->fetchall_arrayref({});
    $sth->finish;

    return tool_result($id, "No runs found matching the given criteria.", 0) unless @$runs;

    my $text = sprintf("%-6s  %-8s  %-6s  %-10s  %-7s  %s\n",
        'Run', 'Arch', 'OS', 'Status', 'Blessed', 'Created');
    $text .= '-' x 60 . "\n";

    for my $run (@$runs) {
        $text .= sprintf("%-6d  %-8s  %-6s  %-10s  %-7s  %s\n",
            $run->{id}, $run->{arch}, $run->{osversion}, $run->{status},
            ($run->{blessed} ? 'yes' : 'no'), $run->{created});
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

sub tool_get_log_excerpt($id, $args) {
    my $port = port_from_args($id, $args) or return;
    my $log = $port->log;
    unless (defined $log && length $log) {
        return tool_result($id,
            sprintf(
                "No build log available for %s (port_id=%d, status=%s, arch=%s, run=%d).",
                $port->name, $port->id, $port->status, $port->run->arch, $port->run->id,
            ),
            0);
    }

    my $pattern = $args->{pattern} // '';
    my $context = bounded_int($args->{context_lines}, 8, 0, 50);

    my $text = sprintf(
        "Build log excerpt for %s\n  port_id=%d  status=%s  arch=%s  osversion=%s  run=%d\n",
        $port->name, $port->id, $port->status,
        $port->run->arch, $port->run->osversion, $port->run->id,
    );

    if (length $pattern) {
        my @lines = split /\n/, $log;
        my $match_index;
        for my $i (0 .. $#lines) {
            $match_index = $i if index($lines[$i], $pattern) >= 0;
        }

        unless (defined $match_index) {
            return tool_result($id, $text . "\nPattern not found: $pattern", 0);
        }

        my $start = $match_index - $context;
        $start = 0 if $start < 0;
        my $end = $match_index + $context;
        $end = $#lines if $end > $#lines;

        $text .= sprintf(
            "\nPattern: %s\nShowing lines %d-%d around last match at line %d:\n\n",
            $pattern, $start + 1, $end + 1, $match_index + 1,
        );
        for my $i ($start .. $end) {
            $text .= sprintf("%6d%s %s\n",
                $i + 1, ($i == $match_index ? '>' : ':'), $lines[$i]);
        }

        return tool_result($id, $text, 0);
    }

    my $tail_bytes = bounded_int($args->{tail_bytes}, 20_000, 1_000, 100_000);
    my $truncated = length($log) > $tail_bytes;
    my $excerpt = $truncated ? substr($log, -$tail_bytes) : $log;
    $text .= sprintf("\nTail excerpt: final %d bytes%s\n\n",
        length($excerpt), $truncated ? " (log truncated)" : "");
    $text .= $excerpt;

    tool_result($id, $text, 0);
}

sub tool_get_port_details($id, $args) {
    unless (defined $args->{port_id} && is_number($args->{port_id})) {
        return tool_result($id, "Error: 'port_id' must be a valid integer.", 1);
    }

    my $port_id = int($args->{port_id});
    my $port = eval { Magus::Port->retrieve($port_id) };
    return tool_result($id, "Port ID $port_id not found.", 1) unless $port;

    # Extract single fields directly instead of triggering multiple lazy loads
    my $run = $port->run;

    my $text = sprintf("Port: %s\n", $port->name);
    $text .= sprintf("  port_id:     %d\n",   $port->id);
    $text .= sprintf("  pkgname:     %s\n",   $port->pkgname);
    $text .= sprintf("  version:     %s\n",   $port->version  // '');
    $text .= sprintf("  status:      %s\n",   $port->status);
    $text .= sprintf("  flavor:      %s\n",   $port->flavor   // '');
    $text .= sprintf("  arch:        %s\n",   $run->arch);
    $text .= sprintf("  osversion:   %s\n",   $run->osversion);
    $text .= sprintf("  run_id:      %d\n",   $run->id);
    $text .= sprintf("  description: %s\n",   $port->description // '');
    $text .= sprintf("  www:         %s\n",   $port->www         // '');
    $text .= sprintf("  license:     %s\n",   $port->license     // '');
    $text .= sprintf("  cpe:         %s\n",   $port->cpe         // '');

    my $dbh = Magus::DBI->db_Main();

    # Build events (failures, warnings, info messages) using direct SQL
    my $sth_events = $dbh->prepare("SELECT time, type, msg FROM events WHERE port = ? ORDER BY time");
    $sth_events->execute($port_id);
    my $events = $sth_events->fetchall_arrayref({});
    $sth_events->finish;

    if (@$events) {
        $text .= "\nBuild events:\n";
        for my $ev (@$events) {
            $text .= sprintf("  [%s] type=%-10s  %s\n",
                $ev->{time} // '?', $ev->{type} // '?', $ev->{msg} // '');
        }
    } else {
        $text .= "\nNo build events recorded.\n";
    }

    # Direct dependencies using direct SQL
    my $sth = $dbh->prepare("
        SELECT d.type, p.name, p.status, p.id
        FROM depends d
        JOIN ports p ON d.dependency = p.id
        WHERE d.port = ?
        ORDER BY d.type, p.name
    ");
    $sth->execute($port_id);
    my $deps = $sth->fetchall_arrayref({});
    $sth->finish;

    if (@$deps) {
        $text .= sprintf("\nDependencies (%d):\n", scalar @$deps);
        for my $dep (@$deps) {
            $text .= sprintf("  [%-8s] %-35s  status=%-9s  port_id=%d\n",
                $dep->{type}, $dep->{name}, $dep->{status}, $dep->{id});
        }
    } else {
        $text .= "\nNo dependencies.\n";
    }

    # Reverse dependencies (ports that need this one)
    $sth = $dbh->prepare("
        SELECT p.name, p.status, p.id
        FROM depends d
        JOIN ports p ON d.port = p.id
        WHERE d.dependency = ?
        ORDER BY p.name
    ");
    $sth->execute($port_id);
    my $rdeps = $sth->fetchall_arrayref({});
    $sth->finish;

    if (@$rdeps) {
        my $shown_max = 20;
        $text .= sprintf("\nRequired by (%d port%s):\n",
            scalar @$rdeps, @$rdeps == 1 ? '' : 's');
        my $shown = 0;
        for my $rdep (@$rdeps) {
            last if $shown >= $shown_max;
            $text .= sprintf("  %-35s  status=%-9s  port_id=%d\n",
                $rdep->{name}, $rdep->{status}, $rdep->{id});
            $shown++;
        }
        $text .= sprintf("  ... and %d more\n", scalar(@$rdeps) - $shown_max)
            if @$rdeps > $shown_max;
    }

    tool_result($id, $text, 0);
}

sub tool_get_port_events($id, $args) {
    my $port = port_from_args($id, $args) or return;
    my $limit = bounded_int($args->{limit}, 100, 1, 500);

    my @where = ('e.port = ?');
    my @bind = ($port->id);

    if (defined $args->{type} && $args->{type} =~ /^[\w.-]+$/) {
        push @where, 'e.type = ?';
        push @bind, $args->{type};
    }
    if (defined $args->{phase} && $args->{phase} =~ /^[\w.-]+$/) {
        push @where, 'e.phase = ?';
        push @bind, $args->{phase};
    }
    if (defined $args->{machine_id} && is_number($args->{machine_id})) {
        push @where, 'e.machine = ?';
        push @bind, int($args->{machine_id});
    }

    my $where = join(' AND ', @where);
    my $dbh = Magus::DBI->db_Main();
    my $sth = $dbh->prepare("
        SELECT e.id, e.time, e.phase, e.type, e.name, e.msg, e.machine,
               m.name AS machine_name
        FROM events e
        LEFT JOIN machines m ON e.machine = m.id
        WHERE $where
        ORDER BY e.time DESC, e.id DESC
        LIMIT ?
    ");
    $sth->execute(@bind, $limit);
    my $events = $sth->fetchall_arrayref({});
    $sth->finish;

    my $text = sprintf("Events for %s\n  port_id=%d  status=%s  run=%d\n",
        $port->name, $port->id, $port->status, $port->run->id);

    unless (@$events) {
        return tool_result($id, $text . "\nNo matching events found.", 0);
    }

    $text .= sprintf("\nShowing %d event%s:\n", scalar @$events, @$events == 1 ? '' : 's');
    for my $ev (@$events) {
        $text .= sprintf(
            "  [%s] type=%s phase=%s machine=%s%s\n    %s\n",
            $ev->{time} // '?',
            $ev->{type} // '',
            $ev->{phase} // '',
            $ev->{machine_name} // '',
            defined $ev->{machine} ? "($ev->{machine})" : '',
            $ev->{msg} // '',
        );
    }

    tool_result($id, $text, 0);
}

sub tool_get_dependency_blockers($id, $args) {
    my $port = port_from_args($id, $args) or return;
    my $max_depth = bounded_int($args->{max_depth}, 8, 1, 20);
    my $limit = bounded_int($args->{limit}, 50, 1, 200);

    my $dbh = Magus::DBI->db_Main();
    my $sth = $dbh->prepare(q{
        SELECT d.type, p.id, p.name, p.pkgname, p.version, p.status, p.flavor
        FROM depends d
        JOIN ports p ON d.dependency = p.id
        WHERE d.port = ?
        ORDER BY d.type, p.name
    });

    my @queue = ({
        port_id => $port->id + 0,
        path    => $port->name,
        depth   => 0,
    });
    my %seen = ($port->id => 1);
    my @blockers;

    while (@queue && @blockers < $limit) {
        my $item = shift @queue;
        next if $item->{depth} >= $max_depth;

        $sth->execute($item->{port_id});
        my $deps = $sth->fetchall_arrayref({});

        for my $dep (@$deps) {
            next if $seen{$dep->{id}}++;

            my $dep_path = "$item->{path} -> $dep->{name}";
            if (($dep->{status} // '') =~ /^(?:fail|skip)$/) {
                push @blockers, {
                    %$dep,
                    type  => $dep->{type},
                    depth => $item->{depth} + 1,
                    path  => $dep_path,
                };
                last if @blockers >= $limit;
            }

            push @queue, {
                port_id => $dep->{id} + 0,
                path    => $dep_path,
                depth   => $item->{depth} + 1,
            } if ($dep->{status} // '') eq 'untested';
        }
    }
    $sth->finish;

    my $text = sprintf(
        "Dependency blockers for %s\n  port_id=%d  status=%s  run=%d  max_depth=%d\n",
        $port->name, $port->id, $port->status, $port->run->id, $max_depth,
    );

    unless (@blockers) {
        return tool_result($id,
            $text . "\nNo failed or skipped dependencies found within the requested depth.",
            0);
    }

    $text .= sprintf("\nFound %d blocker%s:\n",
        scalar @blockers, @blockers == 1 ? '' : 's');
    for my $b (@blockers) {
        $text .= sprintf(
            "  depth=%-2d [%-8s] %-35s status=%-5s port_id=%d version=%s%s\n",
            $b->{depth}, $b->{type} // '', $b->{name}, $b->{status},
            $b->{id}, $b->{version} // '', ($b->{flavor} ? " flavor=$b->{flavor}" : ''),
        );
        $text .= "    path: $b->{path}\n";
    }

    tool_result($id, $text, 0);
}

sub tool_get_distfiles($id, $args) {
    my $port = port_from_args($id, $args) or return;
    my $dbh = Magus::DBI->db_Main();

    my $sth = $dbh->prepare("SELECT filename FROM distfiles WHERE port = ? ORDER BY filename");
    $sth->execute($port->id);
    my $distfiles = $sth->fetchall_arrayref({});
    $sth->finish;

    $sth = $dbh->prepare("SELECT filename FROM restricted_distfiles WHERE port = ? ORDER BY filename");
    $sth->execute($port->id);
    my $restricted = $sth->fetchall_arrayref({});
    $sth->finish;

    $sth = $dbh->prepare("SELECT url FROM master_sites WHERE port = ? ORDER BY url");
    $sth->execute($port->id);
    my $sites = $sth->fetchall_arrayref({});
    $sth->finish;

    my $text = sprintf("Distfile data for %s\n  port_id=%d  run=%d\n",
        $port->name, $port->id, $port->run->id);

    $text .= sprintf("\nDistfiles (%d):\n", scalar @$distfiles);
    $text .= @$distfiles ? join('', map { "  $_->{filename}\n" } @$distfiles) : "  none\n";

    $text .= sprintf("\nRestricted distfiles (%d):\n", scalar @$restricted);
    $text .= @$restricted ? join('', map { "  $_->{filename}\n" } @$restricted) : "  none\n";

    $text .= sprintf("\nMaster sites (%d):\n", scalar @$sites);
    if (@$sites) {
        for my $site (@$sites) {
            my $url = $site->{url} // '';
            my $flag = $url =~ m{^(?:http|ftp)://}i ? '  [non-HTTPS]' : '';
            $text .= "  $url$flag\n";
        }
    } else {
        $text .= "  none\n";
    }

    tool_result($id, $text, 0);
}

sub tool_get_port_cves($id, $args) {
    my $port = resolve_port_arg($args);
    return tool_result($id,
        "Error: pass a valid 'port_id' or 'name' argument.", 1) unless $port;

    my $cpe = $port->cpe // '';
    $cpe =~ s/^\s+|\s+$//g;
    unless (length $cpe) {
        return tool_result($id,
            sprintf("No CPE is recorded for %s (port_id=%d).",
                $port->name, $port->id), 0);
    }

    my $encoded_cpe = uri_escape($cpe);
    my $url = "https://sec.midnightbsd.org/api/cpe/partial-match"
            . "?includeVersion=true&cpe=$encoded_cpe";

    my ($raw, $error) = fetch_cve_api($url);
    if (defined $error) {
        return tool_result($id, "CVE API request failed for $cpe: $error", 1);
    }

    my $data = eval { $json->decode($raw) };
    if ($@) {
        return tool_result($id,
            "CVE API returned invalid JSON for $cpe: $@", 1);
    }

    my $text = sprintf(
        "CVE information for %s\n  port_id=%d  pkgname=%s  version=%s\n  cpe=%s\n",
        $port->name, $port->id, $port->pkgname, $port->version // '', $cpe,
    );
    $text .= format_cve_data($data);

    if ($args->{include_raw}) {
        $text .= "\nRaw CVE API response:\n" . $json->encode($data) . "\n";
    }

    tool_result($id, $text, 0);
}

sub tool_list_run_ports($id, $args) {
    unless (defined $args->{run_id} && is_number($args->{run_id})) {
        return tool_result($id, "Error: 'run_id' must be a valid integer.", 1);
    }

    my $run_id = int($args->{run_id});
    my $run = eval { Magus::Run->retrieve($run_id) };
    return tool_result($id, "Run ID $run_id not found.", 1) unless $run;

    my $limit = bounded_int($args->{limit}, 100, 1, 500);
    my @where = ('p.run = ?');
    my @bind = ($run_id);

    if (defined $args->{status} && $args->{status} =~ /^[\w.-]+$/) {
        push @where, 'p.status = ?';
        push @bind, $args->{status};
    }
    if (defined $args->{name} && length $args->{name}) {
        my $name = clean_port_search($args->{name});
        if (length $name) {
            push @where, 'p.name LIKE ?';
            push @bind, "%$name%";
        }
    }
    if (defined $args->{pkgname} && length $args->{pkgname}) {
        my $pkgname = clean_port_search($args->{pkgname});
        if (length $pkgname) {
            push @where, 'p.pkgname LIKE ?';
            push @bind, "%$pkgname%";
        }
    }
    if (defined $args->{flavor} && $args->{flavor} =~ /^[\w.+-]*$/) {
        push @where, 'p.flavor = ?';
        push @bind, $args->{flavor};
    }
    if (defined $args->{category} && $args->{category} =~ /^[\w.+-]+$/) {
        push @where, 'p.name LIKE ?';
        push @bind, "$args->{category}/%";
    }

    my $where = join(' AND ', @where);
    my $dbh = Magus::DBI->db_Main();
    my $sth = $dbh->prepare("
        SELECT p.id, p.name, p.pkgname, p.version, p.status, p.flavor
        FROM ports p
        WHERE $where
        ORDER BY p.status, p.name, p.flavor
        LIMIT ?
    ");
    $sth->execute(@bind, $limit);
    my $ports = $sth->fetchall_arrayref({});
    $sth->finish;

    my $text = sprintf(
        "Ports for run %d\n  arch=%s  osversion=%s  status=%s  blessed=%s\n",
        $run->id, $run->arch, $run->osversion, $run->status,
        ($run->blessed ? 'yes' : 'no'),
    );

    unless (@$ports) {
        return tool_result($id, $text . "\nNo ports matched the filters.", 0);
    }

    $text .= sprintf("\nShowing %d matching port%s (limit %d):\n",
        scalar @$ports, @$ports == 1 ? '' : 's', $limit);
    for my $p (@$ports) {
        $text .= format_port_summary($p, $run);
    }

    tool_result($id, $text, 0);
}

sub tool_search_ports($id, $args) {
    my $limit = bounded_int($args->{limit}, 100, 1, 500);
    my @where;
    my @bind;

    if (defined $args->{run_id}) {
        unless (is_number($args->{run_id})) {
            return tool_result($id, "Error: 'run_id' must be a valid integer.", 1);
        }
        push @where, 'p.run = ?';
        push @bind, int($args->{run_id});
    }
    if (defined $args->{status} && $args->{status} =~ /^[\w.-]+$/) {
        push @where, 'p.status = ?';
        push @bind, $args->{status};
    }
    if (defined $args->{arch} && $args->{arch} =~ /^[\w.-]+$/) {
        push @where, 'r.arch = ?';
        push @bind, $args->{arch};
    }
    if (defined $args->{osversion} && $args->{osversion} =~ /^[\w.-]+$/) {
        push @where, 'r.osversion = ?';
        push @bind, $args->{osversion};
    }
    if (defined $args->{flavor} && $args->{flavor} =~ /^[\w.+-]*$/) {
        push @where, 'p.flavor = ?';
        push @bind, $args->{flavor};
    }
    if (defined $args->{name} && length $args->{name}) {
        my $name = clean_port_search($args->{name});
        if (length $name) {
            push @where, $name =~ m|/| ? 'p.name = ?' : 'p.name LIKE ?';
            push @bind, $name =~ m|/| ? $name : "%$name%";
        }
    }
    if (defined $args->{pkgname} && length $args->{pkgname}) {
        my $pkgname = clean_port_search($args->{pkgname});
        if (length $pkgname) {
            push @where, 'p.pkgname LIKE ?';
            push @bind, "%$pkgname%";
        }
    }

    unless (@where) {
        return tool_result($id,
            "Error: provide at least one filter such as name, status, run_id, arch, or osversion.",
            1);
    }

    my $where = join(' AND ', @where);
    my $dbh = Magus::DBI->db_Main();
    my $sth = $dbh->prepare("
        SELECT p.id, p.name, p.pkgname, p.version, p.status, p.flavor,
               r.id AS run_id, r.arch, r.osversion, r.blessed
        FROM ports p
        JOIN runs r ON p.run = r.id
        WHERE $where
        ORDER BY r.id DESC, p.name, p.flavor
        LIMIT ?
    ");
    $sth->execute(@bind, $limit);
    my $ports = $sth->fetchall_arrayref({});
    $sth->finish;

    unless (@$ports) {
        return tool_result($id, "No ports matched the filters.", 0);
    }

    my $text = sprintf("Search results (%d shown, limit %d):\n",
        scalar @$ports, $limit);
    for my $p (@$ports) {
        $text .= sprintf(
            "  %-35s status=%-9s arch=%-8s os=%-6s run=%-6d blessed=%-3s version=%s\n",
            $p->{name}, $p->{status}, $p->{arch}, $p->{osversion}, $p->{run_id},
            ($p->{blessed} ? 'yes' : 'no'), $p->{version} // '',
        );
        $text .= sprintf("    port_id=%d pkgname=%s%s\n",
            $p->{id}, $p->{pkgname}, ($p->{flavor} ? " flavor=$p->{flavor}" : ''));
    }

    tool_result($id, $text, 0);
}

sub tool_compare_port_runs($id, $args) {
    my $name = clean_port_search($args->{name} // '');
    unless (length $name) {
        return tool_result($id, "Error: 'name' is required.", 1);
    }
    for my $key (qw(run_id_a run_id_b)) {
        unless (defined $args->{$key} && is_number($args->{$key})) {
            return tool_result($id, "Error: '$key' must be a valid integer.", 1);
        }
    }

    my $run_a = eval { Magus::Run->retrieve(int($args->{run_id_a})) };
    my $run_b = eval { Magus::Run->retrieve(int($args->{run_id_b})) };
    return tool_result($id, "Run ID $args->{run_id_a} not found.", 1) unless $run_a;
    return tool_result($id, "Run ID $args->{run_id_b} not found.", 1) unless $run_b;

    my @a = port_rows_for_run_and_name($run_a->id, $name);
    my @b = port_rows_for_run_and_name($run_b->id, $name);

    my $text = sprintf(
        "Comparison for '%s'\n  run A: %d arch=%s os=%s blessed=%s\n  run B: %d arch=%s os=%s blessed=%s\n",
        $name,
        $run_a->id, $run_a->arch, $run_a->osversion, ($run_a->blessed ? 'yes' : 'no'),
        $run_b->id, $run_b->arch, $run_b->osversion, ($run_b->blessed ? 'yes' : 'no'),
    );

    $text .= "\nRun A matches:\n";
    $text .= @a ? join('', map { format_port_summary($_, $run_a) } @a) : "  none\n";

    $text .= "\nRun B matches:\n";
    $text .= @b ? join('', map { format_port_summary($_, $run_b) } @b) : "  none\n";

    if (@a && @b) {
        my $pa = $a[0];
        my $pb = $b[0];
        $text .= "\nFirst-match delta:\n";
        $text .= sprintf("  status:  %s -> %s%s\n",
            $pa->{status}, $pb->{status},
            $pa->{status} eq $pb->{status} ? " (unchanged)" : "");
        $text .= sprintf("  version: %s -> %s%s\n",
            $pa->{version} // '', $pb->{version} // '',
            (($pa->{version} // '') eq ($pb->{version} // '')) ? " (unchanged)" : "");
        $text .= sprintf("  pkgname: %s -> %s%s\n",
            $pa->{pkgname}, $pb->{pkgname},
            $pa->{pkgname} eq $pb->{pkgname} ? " (unchanged)" : "");
    }

    tool_result($id, $text, 0);
}

sub tool_get_machine_events($id, $args) {
    for my $key (qw(run_id machine_id)) {
        unless (defined $args->{$key} && is_number($args->{$key})) {
            return tool_result($id, "Error: '$key' must be a valid integer.", 1);
        }
    }
    my $run_id = int($args->{run_id});
    my $machine_id = int($args->{machine_id});
    my $limit = bounded_int($args->{limit}, 100, 1, 500);

    my $run = eval { Magus::Run->retrieve($run_id) };
    return tool_result($id, "Run ID $run_id not found.", 1) unless $run;
    my $machine = eval { Magus::Machine->retrieve($machine_id) };
    return tool_result($id, "Machine ID $machine_id not found.", 1) unless $machine;

    my $dbh = Magus::DBI->db_Main();
    my $sth = $dbh->prepare(q{
        SELECT e.time, e.phase, e.type, e.name AS event_name, e.msg,
               p.id AS port_id, p.name AS port_name, p.status
        FROM events e
        JOIN ports p ON e.port = p.id
        WHERE p.run = ? AND e.machine = ?
        ORDER BY e.time DESC, e.id DESC
        LIMIT ?
    });
    $sth->execute($run_id, $machine_id, $limit);
    my $events = $sth->fetchall_arrayref({});
    $sth->finish;

    my $text = sprintf(
        "Machine events\n  run=%d arch=%s os=%s  machine=%s(%d)\n",
        $run->id, $run->arch, $run->osversion, $machine->name, $machine->id,
    );

    unless (@$events) {
        return tool_result($id, $text . "\nNo events found.", 0);
    }

    $text .= sprintf("\nShowing %d event%s:\n",
        scalar @$events, @$events == 1 ? '' : 's');
    for my $ev (@$events) {
        $text .= sprintf(
            "  [%s] %-35s status=%-9s port_id=%d type=%s phase=%s\n    %s\n",
            $ev->{time} // '?',
            $ev->{port_name},
            $ev->{status},
            $ev->{port_id},
            $ev->{type} // '',
            $ev->{phase} // '',
            $ev->{msg} // '',
        );
    }

    tool_result($id, $text, 0);
}

sub tool_top_blockers($id, $args) {
    my $limit = $args->{limit} // 20;
    $limit = 20 unless is_number($limit);
    $limit = int($limit);
    $limit = 1   if $limit < 1;
    $limit = 100 if $limit > 100;

    my @runs;
    if (defined $args->{run_id}) {
        unless (is_number($args->{run_id})) {
            return tool_result($id, "Error: 'run_id' must be a valid integer.", 1);
        }

        my $run = eval { Magus::Run->retrieve(int($args->{run_id})) };
        return tool_result($id, "Run ID $args->{run_id} not found.", 1) unless $run;
        push @runs, $run;
    } else {
        @runs = _latest_runs_per_arch();
        return tool_result($id, "No completed build runs found.", 0) unless @runs;
    }

    my $text = "Top blockers\n";
    $text .= "Weights are rough priority scores based on dependency propagation; "
           . "they are not exact counts of blocked ports.\n";

    for my $run (@runs) {
        my @blockers = top_blockers_for_run($run, $limit);

        $text .= sprintf(
            "\nRun %d  arch=%s  osversion=%s  status=%s  blessed=%s\n",
            $run->id, $run->arch, $run->osversion, $run->status,
            ($run->blessed ? 'yes' : 'no'),
        );

        unless (@blockers) {
            $text .= "  No failed or skipped blockers found.\n";
            next;
        }

        $text .= sprintf("%-6s  %-8s  %-6s  %-9s  %-30s  %s\n",
            'Weight', 'Port ID', 'Run', 'Status', 'Origin', 'Pkgname');
        $text .= '-' x 78 . "\n";

        for my $b (@blockers) {
            $text .= sprintf("%-6d  %-8d  %-6d  %-9s  %-30s  %s\n",
                $b->{weight}, $b->{port_id}, $b->{run_id}, $b->{status},
                $b->{name}, $b->{pkgname});
        }
    }

    $text .= "\nUse get_port_details with a port_id before fetching logs or patching a port.";
    tool_result($id, $text, 0);
}

# ---------------------------------------------------------------------------
# Internal helpers
# ---------------------------------------------------------------------------

# Returns the most recent complete+blessed run per (arch, osversion).
# Falls back to any complete run if no blessed runs exist.
sub _latest_runs_per_arch() {
    my $dbh = Magus::DBI->db_Main();

    # Use a single query with row_number() window function to find the most recent run
    # for each arch/osversion combination, prioritizing blessed runs.
    # This avoids loading potentially hundreds of run objects into memory just to
    # keep the first one seen per arch.
    my $sth = $dbh->prepare(q{
        SELECT id FROM (
            SELECT id, arch, osversion, blessed,
                   ROW_NUMBER() OVER (
                       PARTITION BY arch, osversion
                       ORDER BY blessed DESC, created DESC
                   ) as rn
            FROM runs
            WHERE status = 'complete'
        ) AS latest_runs
        WHERE rn = 1
        ORDER BY osversion DESC, arch
    });

    $sth->execute();

    my @result;
    while (my $row = $sth->fetchrow_hashref) {
        my $run = Magus::Run->retrieve($row->{id});
        push @result, $run if $run;
    }
    $sth->finish;

    return @result;
}

# Returns the most recent complete run for each blessed state per
# (arch, osversion), so lookup_port can expose current unblessed runs without
# hiding the blessed baseline.
sub _latest_lookup_runs_per_arch() {
    my $dbh = Magus::DBI->db_Main();

    my $sth = $dbh->prepare(q{
        SELECT id FROM (
            SELECT id, arch, osversion, blessed,
                   ROW_NUMBER() OVER (
                       PARTITION BY arch, osversion, blessed
                       ORDER BY created DESC
                   ) as rn
            FROM runs
            WHERE status = 'complete'
        ) AS latest_runs
        WHERE rn = 1
        ORDER BY osversion DESC, arch, blessed DESC
    });

    $sth->execute();

    my @result;
    while (my $row = $sth->fetchrow_hashref) {
        my $run = Magus::Run->retrieve($row->{id});
        push @result, $run if $run;
    }
    $sth->finish;

    return @result;
}

sub resolve_port_arg($args) {
    if (defined $args->{port_id} && is_number($args->{port_id})) {
        return eval { Magus::Port->retrieve(int($args->{port_id})) };
    }

    my $name = $args->{name} // '';
    $name =~ s/[^\w\/.\-+]//g;
    return unless length $name;

    my @runs = _latest_runs_per_arch();

    return unless @runs;

    # Use direct SQL instead of N+1 search queries
    my $dbh = Magus::DBI->db_Main();
    my @run_ids = map { $_->id } @runs;
    my $in_clause = join(',', map { '?' } @run_ids);

    my $query;
    my @bind_params;

    if ($name =~ m|/|) {
        $query = "SELECT id FROM ports WHERE run IN ($in_clause) AND name = ? ORDER BY id DESC LIMIT 1";
        @bind_params = (@run_ids, $name);
    } else {
        # Check for suffix first
        $query = "SELECT id FROM ports WHERE run IN ($in_clause) AND name LIKE ? ORDER BY id DESC LIMIT 1";
        @bind_params = (@run_ids, "%/$name");

        my $sth = $dbh->prepare($query);
        $sth->execute(@bind_params);
        my $row = $sth->fetchrow_hashref;
        $sth->finish;

        return Magus::Port->retrieve($row->{id}) if $row;

        # Fall back to generic substring
        @bind_params = (@run_ids, "%$name%");
    }

    my $sth = $dbh->prepare($query);
    $sth->execute(@bind_params);
    my $row = $sth->fetchrow_hashref;
    $sth->finish;

    return $row ? Magus::Port->retrieve($row->{id}) : undef;
}

sub top_blockers_for_run($run, $limit) {
    my %blocking;

    # Pre-fetch untested ports for this run directly from the DB rather than Class::DBI object per row
    my $dbh = Magus::DBI->db_Main();

    # We want to find all failed/skipped dependencies that caused ports to be untested.
    # Rather than N+1 queries through Class::DBI relationships, we can use a direct query.
    my $sth = $dbh->prepare(q{
        SELECT d.dependency, COUNT(p.id) as blocked_count
        FROM ports p
        JOIN depends d ON p.id = d.port
        JOIN ports dep ON d.dependency = dep.id
        WHERE p.run = ?
          AND p.status = 'untested'
          AND dep.status IN ('fail', 'skip', 'untested')
        GROUP BY d.dependency
        ORDER BY blocked_count DESC
    });

    $sth->execute($run->id);

    my @blockers;
    while (my $row = $sth->fetchrow_hashref) {
        my $port_id = $row->{dependency};
        my $count = $row->{blocked_count};

        # We only retrieve the port object for the top blockers to save memory/DB time
        my $port = Magus::Port->retrieve($port_id);
        next unless $port;
        next if $port->status eq 'untested'; # We just want the root cause (fail/skip), not the intermediate untested ones

        push @blockers, {
            weight    => $count + 0,
            port_id   => $port->id + 0,
            run_id    => $run->id + 0,
            name      => $port->name,
            pkgname   => $port->pkgname,
            version   => $port->version // '',
            status    => $port->status,
            flavor    => $port->flavor // '',
            arch      => $run->arch,
            osversion => $run->osversion,
        };

        last if @blockers >= $limit;
    }

    $sth->finish;

    return @blockers;
}

sub port_from_args($id, $args) {
    unless (defined $args->{port_id} && is_number($args->{port_id})) {
        tool_result($id, "Error: 'port_id' must be a valid integer.", 1);
        return;
    }

    my $port_id = int($args->{port_id});
    my $port = eval { Magus::Port->retrieve($port_id) };
    unless ($port) {
        tool_result($id, "Port ID $port_id not found.", 1);
        return;
    }

    return $port;
}

sub bounded_int($value, $default, $min, $max) {
    my $n = defined $value && is_number($value) ? int($value) : $default;
    $n = $min if $n < $min;
    $n = $max if $n > $max;
    return $n;
}

sub clean_port_search($value) {
    $value //= '';
    $value =~ s/[^\w\/.\-+]//g;
    return $value;
}

sub format_port_summary($port, $run) {
    return sprintf(
        "  %-35s status=%-9s port_id=%-7d version=%s pkgname=%s%s\n",
        $port->{name}, $port->{status}, $port->{id},
        $port->{version} // '', $port->{pkgname} // '',
        ($port->{flavor} ? " flavor=$port->{flavor}" : ''),
    );
}

sub port_rows_for_run_and_name($run_id, $name) {
    my $dbh = Magus::DBI->db_Main();
    my ($query, @bind);

    if ($name =~ m|/|) {
        $query = q{
            SELECT id, name, pkgname, version, status, flavor
            FROM ports
            WHERE run = ? AND name = ?
            ORDER BY flavor, id
        };
        @bind = ($run_id, $name);
    } else {
        $query = q{
            SELECT id, name, pkgname, version, status, flavor
            FROM ports
            WHERE run = ? AND name LIKE ?
            ORDER BY name, flavor, id
            LIMIT 20
        };
        @bind = ($run_id, "%$name%");
    }

    my $sth = $dbh->prepare($query);
    $sth->execute(@bind);
    my $rows = $sth->fetchall_arrayref({});
    $sth->finish;

    return @$rows;
}

sub fetch_cve_api($url) {
    my $ua = LWP::UserAgent->new;
    $ua->timeout(30);
    my $response = $ua->get($url);
    return ($response->decoded_content, undef) if $response->is_success;

    if ($response->status_line =~ /Protocol scheme 'https' is not supported/) {
        my $content = '';
        if (open(my $fh, '-|', '/usr/bin/fetch', '-qo', '-', $url)) {
            local $/;
            $content = <$fh> // '';
            close $fh;
            return ($content, undef) if $? == 0;
        }
        chomp $content;
        return (undef, $content || 'fetch fallback failed');
    }

    return (undef, $response->status_line);
}

sub format_cve_data($data) {
    my @items = cve_items_from_data($data);
    return "\nNo matching CVE records were returned by the API.\n" unless @items;

    my $text = sprintf("\nMatching CVE records: %d\n", scalar @items);
    my $shown = 0;
    for my $item (@items) {
        last if $shown >= 20;
        $shown++;
        $text .= format_cve_item($item);
    }
    $text .= sprintf("... and %d more records\n", scalar(@items) - $shown)
        if @items > $shown;

    return $text;
}

sub cve_items_from_data($data) {
    return @$data if ref $data eq 'ARRAY';
    return @{$data->{results}}         if ref $data eq 'HASH' && ref $data->{results} eq 'ARRAY';
    return @{$data->{vulnerabilities}} if ref $data eq 'HASH' && ref $data->{vulnerabilities} eq 'ARRAY';
    return @{$data->{cves}}            if ref $data eq 'HASH' && ref $data->{cves} eq 'ARRAY';
    return @{$data->{data}}            if ref $data eq 'HASH' && ref $data->{data} eq 'ARRAY';
    return ($data) if ref $data eq 'HASH' && keys %$data;
    return;
}

sub format_cve_item($item) {
    return "  $item\n" unless ref $item eq 'HASH';

    my $id = first_defined(
        $item->{cveId}, $item->{cve_id}, $item->{cve}, $item->{name}, $item->{id},
        ref $item->{cve} eq 'HASH' ? $item->{cve}{id} : undef,
    ) // 'unknown';
    my $severity = first_defined(
        $item->{severity},
        $item->{baseSeverity},
        $item->{cvss_severity},
        cvss_metric_field($item, 'baseSeverity'),
        $item->{impact},
    ) // '';
    my $summary = first_defined($item->{summary}, $item->{description}, $item->{title}) // '';
    my $url = first_defined($item->{url}, $item->{href}, $item->{link}) // '';

    my $text = "  $id";
    $text .= "  severity=$severity" if length $severity;
    $text .= "\n";
    $text .= "    $summary\n" if length $summary;
    $text .= "    $url\n" if length $url;

    return $text;
}

sub cvss_metric_field($item, $field) {
    return undef unless ref $item eq 'HASH';
    for my $key (qw(cvssMetrics3 cvssMetricV31 cvssMetricV30 cvssMetrics2 cvssMetricV2)) {
        next unless ref $item->{$key} eq 'ARRAY' && @{$item->{$key}};
        return $item->{$key}[0]{$field} if defined $item->{$key}[0]{$field};
    }

    return undef;
}

sub first_defined(@values) {
    for my $value (@values) {
        return $value if defined $value && !ref $value;
    }

    return undef;
}

sub is_number($n) {
    return looks_like_number($n) && $n !~ /inf|nan/i;
}

sub acknowledge_notification() {
    return if $collect_responses;
    print json_header(-status => '202 Accepted');
}

sub handle_sse_get() {
    unless (validate_mcp_protocol_header()) {
        http_json_error('400 Bad Request', undef, -32600,
            'Unsupported MCP-Protocol-Version header');
        return;
    }

    $| = 1;
    print $cgi->header(
        -type          => 'text/event-stream',
        -charset       => 'UTF-8',
        -cache_control => 'no-cache',
        -expires       => 'now',
        -pragma        => 'no-cache',
    );

    # Send the required MCP SSE endpoint event
    my $endpoint = $cgi->url(-absolute => 1);
    print "event: endpoint\n";
    print "data: $endpoint\n\n";

    my $keepalives = $ENV{MCP_SSE_KEEPALIVES} // 6;
    $keepalives = 6 unless is_number($keepalives);
    $keepalives = int($keepalives);
    $keepalives = 1  if $keepalives < 1;
    $keepalives = 60 if $keepalives > 60;

    my $interval = $ENV{MCP_SSE_KEEPALIVE_INTERVAL} // 10;
    $interval = 10 unless is_number($interval);
    $interval = int($interval);
    $interval = 1  if $interval < 1;
    $interval = 60 if $interval > 60;

    for (1 .. $keepalives) {
        print ": magus-mcp keepalive\n\n";
        sleep $interval if $_ < $keepalives;
    }
}

sub json_header(%args) {
    return $cgi->header(
        -type    => 'application/json',
        -charset => 'UTF-8',
        %args,
    );
}

sub http_json_error($status, $id, $code, $message) {
    print json_header(-status => $status);
    print $json->encode({
        jsonrpc => '2.0',
        id      => $id,
        error   => { code => $code + 0, message => $message },
    });
}

sub accepts_content_type($wanted) {
    my $accept = $ENV{HTTP_ACCEPT} // '';
    return 0 unless length $accept;

    my ($wanted_type, $wanted_subtype) = split m{/}, lc $wanted, 2;
    for my $entry (split /,/, $accept) {
        $entry =~ s/^\s+|\s+$//g;
        my ($media_type) = split /\s*;\s*/, lc $entry, 2;
        my ($type, $subtype) = split m{/}, $media_type, 2;
        next unless defined $type && defined $subtype;
        return 1 if $type eq '*' && $subtype eq '*';
        return 1 if $type eq $wanted_type && $subtype eq '*';
        return 1 if $type eq $wanted_type && $subtype eq $wanted_subtype;
    }

    return 0;
}

sub is_initialize_request($req) {
    return ref $req eq 'HASH'
        && defined $req->{method}
        && $req->{method} eq 'initialize';
}

sub batch_contains_initialize($batch) {
    for my $message (@$batch) {
        return 1 if is_initialize_request($message);
    }

    return 0;
}

sub is_jsonrpc_response($req) {
    return 0 unless exists $req->{id};
    return 0 if exists $req->{result} && exists $req->{error};
    return exists $req->{result} || exists $req->{error};
}

sub negotiated_protocol_version($requested) {
    return $SUPPORTED_PROTOCOL_VERSIONS[0] unless defined $requested;

    for my $version (@SUPPORTED_PROTOCOL_VERSIONS) {
        return $version if $requested eq $version;
    }

    return $SUPPORTED_PROTOCOL_VERSIONS[0];
}

sub validate_mcp_protocol_header() {
    my $version = effective_protocol_version();

    for my $supported (@SUPPORTED_PROTOCOL_VERSIONS) {
        return 1 if $version eq $supported;
    }

    return 0;
}

sub effective_protocol_version() {
    my $version = $ENV{HTTP_MCP_PROTOCOL_VERSION} // '';
    return length $version ? $version : '2025-03-26';
}

sub tool_result($id, $text, $is_error) {
    rpc_result($id, {
        content => [{ type => 'text', text => $text }],
        isError => $is_error ? \1 : \0,
    });
}

sub rpc_result($id, $result) {
    my $response = {
        jsonrpc => '2.0',
        id      => $id,
        result  => $result,
    };
    if ($collect_responses) {
        push @collected_responses, $response;
        return;
    }

    print json_header();
    print $json->encode($response);
}

sub rpc_error($id, $code, $message) {
    my $response = {
        jsonrpc => '2.0',
        id      => $id,
        error   => { code => $code + 0, message => $message },
    };
    if ($collect_responses) {
        push @collected_responses, $response;
        return;
    }

    print json_header(-status => '400 Bad Request');
    print $json->encode($response);
}
