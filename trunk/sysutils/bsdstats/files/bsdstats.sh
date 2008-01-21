#!/bin/sh 
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/bsdstats/files/bsdstats.sh,v 1.1 2007/04/28 23:54:03 scrappy Exp $
#

# PROVIDE: bsdstats
# REQUIRE: LOGIN
# KEYWORD: shutdown

# bsdstats is disabled by default, if you have configuration file
#
# Add the following line to /etc/rc.conf to enable bsdstats:
#
#bsdstats_enable="YES"
#

. /etc/rc.subr

load_rc_config bsdstats

name=bsdstats
rcvar=`set_rcvar`

command=/usr/local/etc/periodic/monthly/300.statistics

# default to disable
bsdstats_enable=${bsdstats_enable:-"NO"}
bsdstats_flags=${bsdstats_flags:-"-nodelay"}

run_rc_command "$1"
