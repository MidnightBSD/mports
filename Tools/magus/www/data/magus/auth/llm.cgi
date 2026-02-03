#!/usr/local/bin/perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use JSON;

print "Content-type: application/json\n\n";

my $cgi = CGI->new;
my $content = $cgi->param('content');

if (!defined $content || $content eq '') {
	print encode_json({
		error => "content parameter is missing"
	});
	exit;
}

# Additional check after decoding
if ($content =~ /^\s*$/) {
    print encode_json({ error => "content parameter contains only whitespace" });
    exit;
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
    print $data->{choices}[0]{message}{content}, "\n";
} else {
	print encode_json({
		error => "API request failed",
		status => $response->status_line
	});
}

