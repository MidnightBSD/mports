#!/bin/sh
# $MidnightBSD$
# Author: Lucas Holt
# License: BSD 2 clause

USERNAME=$1
PASSWORD=$2

if [ $# -lt 2 ]; then
	echo "usage: $0 username password message";
	exit;
fi
if [ $# -gt 3 ]; then
	echo "usage: $0 username password message";
	exit;
fi
	`which curl` --basic --user "${USERNAME}:${PASSWORD}" --data-ascii "status=`echo $3|tr ' ' '+'`" "http://twitter.com/statuses/update.json" -o /dev/null
	echo Message Sent!
