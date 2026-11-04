#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use CGI;


use Scalar::Util qw(looks_like_number);

sub is_number {
        my $num = shift;
        return defined($num) && looks_like_number($num) && $num !~ /inf|nan/i && $num > 0;
}

eval { main() };

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

sub main {
        my $q = CGI->new;
        my $id = $q->param('id');
        die "No id given.\n" unless defined $id;
        die "Invalid id given.\n" unless is_number($id);

        my $lock = Magus::Lock->retrieve($id) || die "No such lock: $id\n";

        $lock->delete;

        my $target = $q->referer || '/magus/';
        if ($target !~ m{^/(?:magus)?}i && $target !~ m{^https?://(?:www\.)?midnightbsd\.org/magus}i) {
                $target = '/magus/';
        }

        print $q->redirect($target);
}
