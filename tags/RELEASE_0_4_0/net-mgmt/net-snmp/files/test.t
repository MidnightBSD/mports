#!/usr/bin/perl -w
#
# $FreeBSD: ports/net-mgmt/net-snmp/files/test.t,v 1.1 2005/11/30 05:22:40 kuriyama Exp $

use strict;
use Test::More tests => 1;

my $cmd = 'snmpwalk -c public -v 1 localhost';

# ports/86572
my $output = `$cmd hrSWRunType`;
like($output, qr/operatingSystem/, 'hrSWRunType');
