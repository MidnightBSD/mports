#!/usr/local/bin/perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use JSON;
use YAML::Tiny;
use utf8;

my $cgi = CGI->new;

my $origin = $cgi->http('Origin') || '*'; 

# 1. Handle the "Preflight" OPTIONS request
if ($cgi->request_method() eq 'OPTIONS') {
    print $cgi->header(
        -type    => 'text/plain',
        -status  => '200 OK',
        -access_control_allow_origin  => $origin,
        -access_control_allow_methods => 'POST, GET, OPTIONS',
        -access_control_allow_headers => 'Content-Type, Authorization', # Add any custom headers you use
        -access_control_max_age       => '1728000',
	-access_control_allow_credentials => 'true',
    );
    exit;
}

sub print_json_response {
    my ($status, $data) = @_;
    print $cgi->header(
        -type   => 'application/json',
        -status => $status,
        -access_control_allow_origin => $origin, # Required for the actual response too
	-access_control_allow_credentials => 'true'
    );
    print encode_json($data);
    exit;
}

# Read configuration for API keys
my $config_path = '/usr/magus/config.yaml';
my $config = {};
if (-e $config_path) {
    eval {
        $config = YAML::Tiny->read($config_path)->[0] || {};
    };
    if ($@) {
        # ignore or log config error
    }
}

my $content = $cgi->param('content');

if (!defined $content || $content eq '') {
	print_json_response('400 Bad Request', { error => "Content parameter is missing" });
}

# Additional check after decoding
if ($content =~ /^\s*$/) {
	print_json_response('400 Bad Request', { error => "Content parameter contains only whitespace" });
}

# Ensure the content is treated as a UTF-8 string
my $safe_content = $content;
utf8::decode($safe_content) unless utf8::is_utf8($safe_content);
$safe_content =~ s/[[:cntrl:]]//g;

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

my $model_param = $cgi->param('model');
my $model = "qwen2.5-coder:14b"; # Default

if (defined $model_param && $model_param ne '') {
    my $requested_model = lc $model_param;
    if ($ALLOWED_MODELS{$requested_model}) {
        $model = $requested_model;
    } elsif ($ALLOWED_MODELS{$model_param}) {
        $model = $model_param;
    } else {
        print_json_response('400 Bad Request', { error => "Model '$model_param' is not supported." });
    }
}

my $ua = LWP::UserAgent->new;
$ua->timeout(300);

my $url;
my $is_mistral = $MISTRAL_MODELS{$model} || 0;

if ($is_mistral) {
    $url = 'https://api.mistral.ai/v1/chat/completions';
} else {
    $url = 'http://llm.midnightbsd.org:11434/v1/chat/completions';
}

my $payload = {
    model => $model,
    messages => [
        { role => "system", content => "Provide a technical analysis of error logs for building software applications in the MidnightBSD ports tree. MidnightBSD uses mport rather than pkg and magus rather than poudriere." },
        { role => "user", content => $safe_content }
    ],
    stream => \0
};

my $json_payload = encode_json($payload);

my $req = HTTP::Request->new( 'POST', $url );
$req->header( 'Content-Type' => 'application/json; charset=utf-8' );

if ($is_mistral) {
    my $api_key = $config->{MistralApiKey} // '';
    unless ($api_key) {
        print_json_response('500 Internal Error', { error => "Mistral API key not configured in $config_path" });
    }
    $req->header('User-Agent' => 'MistralPerlClient/1.0');
    $req->header('Authorization' => "Bearer $api_key");
} else {
    $req->header( 'Content-Length' => length($json_payload) );
}

$req->content( $json_payload );

my $response = $ua->request($req);

if ($response->is_success) {
    # Check if the body is actually empty or malformed
    my $raw_content = $response->decoded_content;
    eval {
        my $data = decode_json($raw_content);
        print_json_response('200 OK', [ $data->{choices}[0]{message}{content} ]);
    };
    if ($@) {
        print_json_response('500 Internal Error', { error => "JSON Parsing failed: $@", raw => $raw_content });
    }
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
            my $api_key = $config->{MistralApiKey} // '';
            push @args, '--http-header', "Authorization: Bearer $api_key";
            push @args, '--http-header', "Content-Type: application/json; charset=utf-8";
        } else {
            push @args, '--http-header', "Content-Type: application/json; charset=utf-8";
        }

        # Tell fetch to POST the file
        $ENV{HTTP_METHOD} = 'POST';

        if (open(my $pipe, '-|', @args, $url, '<', $filename)) {
             local $/;
             $content = <$pipe> // '';
             close $pipe;

             # Clean up temp file
             unlink $filename;

             if ($? == 0 && length $content > 0) {
                  eval {
                      my $data = decode_json($content);
                      print_json_response('200 OK', [ $data->{choices}[0]{message}{content} ]);
                  };
                  if ($@) {
                      print_json_response('500 Internal Error', { error => "JSON Parsing failed (fetch fallback): $@", raw => $content });
                  }
                  exit; # we handled it with fetch
             } else {
                 print_json_response('502 Bad Gateway', { error => "Fetch fallback failed with exit code $?", raw => $content });
             }
        } else {
            unlink $filename if -e $filename;
            print_json_response('500 Internal Error', { error => "Failed to run fetch command for https" });
        }
    }

	print_json_response('502 Bad Gateway', {
        error => "Upstream API failed", 
        status => $response->status_line 
	});
}