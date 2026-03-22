#!/usr/local/bin/perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use JSON;

print "Content-type: application/json\n\n";

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


my $content = $cgi->param('content');

if (!defined $content || $content eq '') {
	print_json_response('400 Bad Request', { error => "Content parameter is missing" });
}

# Additional check after decoding
if ($content =~ /^\s*$/) {
	print_json_response('400 Bad Request', { error => "Content parameter contains only whitespace" });
}

my $ua = LWP::UserAgent->new;
$ua->timeout(300);
my $url = 'http://llm.midnightbsd.org:9011/v1/chat/completions';

my $payload = {
    model => "phi-4-Q4_K_S.gguf",
    messages => [
        { role => "user", content => $content }
    ],
};

my $req = HTTP::Request->new( 'POST', $url );
$req->header( 'Content-Type' => 'application/json' );
$req->content( encode_json($payload) );

my $response = $ua->request($req);

if ($response->is_success) {
	my $data = decode_json($response->decoded_content);
	print_json_response('200 OK', [ $data->{choices}[0]{message}{content} ]);
} else {
	print_json_response('502 Bad Gateway', { 
        error => "Upstream API failed", 
        status => $response->status_line 
	});
}
