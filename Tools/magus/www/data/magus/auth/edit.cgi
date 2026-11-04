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

my %ALLOWED_EDIT_CLASSES = (
        'Magus::Run'     => { blessed => 1, status => 1 },
        'Magus::Port'    => { status => 1, description => 1, license => 1, www => 1, cpe => 1 },
        'Magus::Machine' => { name => 1, maintainer => 1, arch => 1, osversion => 1 },
);

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
        my $class  = $q->param('class');
        my $id     = $q->param('id');
        my $attr   = $q->param('attr');
        my $value  = $q->param('value');

        die "No class given.\n" unless defined $class && length $class;
        die "No id given.\n" unless defined $id && length $id;
        die "No attribute given.\n" unless defined $attr && length $attr;
        die "No value given.\n" unless defined $value;

        die "Invalid class.\n" unless exists $ALLOWED_EDIT_CLASSES{$class};
        die "Invalid id given.\n" unless is_number($id);
        die "Invalid attribute for $class.\n" unless $ALLOWED_EDIT_CLASSES{$class}{$attr};

        my $obj = $class->retrieve($id) || die "No such object $class:$id\n";

        $obj->set($attr => $value);
        $obj->update;

        my $target = $q->referer || '/magus/';
        if ($target !~ m{^/(?:magus)?}i && $target !~ m{^https?://(?:www\.)?midnightbsd\.org/magus}i) {
                $target = '/magus/';
        }

        print $q->redirect($target);
}
