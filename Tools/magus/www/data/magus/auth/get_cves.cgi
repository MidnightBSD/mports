#!/usr/local/bin/perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use JSON;
use URI::Escape;

print "Content-type: application/json\n\n";

my $cgi = CGI->new;
my $encoded_cpe = $cgi->param('cpe');
my $cpe = uri_unescape($encoded_cpe);

if (!defined $encoded_cpe || $encoded_cpe eq '') {
	print encode_json({
		error => "CPE parameter is missing"
	});
	exit;
}

# Additional check after decoding
if ($cpe =~ /^\s*$/) {
    print encode_json({ error => "CPE parameter contains only whitespace" });
    exit;
}

my $ua = LWP::UserAgent->new;
my $response = $ua->get("https://sec.midnightbsd.org/api/cpe/partial-match?includeVersion=true&cpe=$encoded_cpe");

if ($response->is_success) {
    print $response->content;
} else {
	print encode_json({
		error => "API request failed",
		status => $response->status_line
	});
}
