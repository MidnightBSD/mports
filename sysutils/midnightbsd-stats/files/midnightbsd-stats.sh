#!/bin/sh 
#
# $MidnightBSD: mports/sysutils/bsdstats/files/bsdstats.sh,v 1.1 2008/01/21 15:44:06 laffer1 Exp $
#

# PROVIDE: midnightbsd_stats
# REQUIRE: LOGIN
# KEYWORD: shutdown

# midnightbsd_stats is disabled by default, if you have configuration file
#
# Add the following line to /etc/rc.conf to enable midnightbsd_stats:
#
#midnightbsd_stats_enable="YES"
#

. /etc/rc.subr

load_rc_config midnightbsd_stats

name=midnightbsd_stats
rcvar=`set_rcvar`

command=/usr/local/etc/periodic/monthly/310.statistics

# default to disable
midnightbsd_stats_enable=${midnightbsd_stats_enable:-"NO"}
midnightbsd_stats_flags=${midnightbsd_stats_flags:-"-nodelay"}

run_rc_command "$1"
