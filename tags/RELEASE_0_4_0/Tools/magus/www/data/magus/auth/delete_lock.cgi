#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(/home/mbsd/magus/mports/Tools/lib);

use Magus;
use CGI;


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
        my $id = $q->param('id') || die "No id given.\n";

        my $lock = Magus::Lock->retrieve($id) || die "No such port: $id\n";

        $lock->delete;

        print $q->redirect($q->referer);
}
