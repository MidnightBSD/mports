#!/bin/sh
# $FreeBSD: ports/mail/milter-greylist/files/milter-greylist.sh,v 1.4 2006/12/10 05:10:38 ache Exp $
# $MidnightBSD$

# PROVIDE: miltergreylist
# REQUIRE: LOGIN
# BEFORE: sendmail
# KEYWORD: milter-greylist

# Define these miltergreylist_* variables in one of these files:
#       /etc/rc.conf
#       /etc/rc.conf.local
#       /etc/rc.conf.d/miltergreylist
#
# DO NOT CHANGE THESE DEFAULT VALUES HERE
#

. %%RC_SUBR%%

name="miltergreylist"
rcvar=`set_rcvar`

load_rc_config $name

miltergreylist_enable=${miltergreylist_enable-"NO"}
miltergreylist_runas=${miltergreylist_runas-"mailnull"}
miltergreylist_pidfile=${miltergreylist_pidfile-"/var/run/milter-greylist.pid"}
miltergreylist_sockfile=${miltergreylist_sockfile-"/var/milter-greylist/milter-greylist.sock"}
miltergreylist_cfgfile=${miltergreylist_cfgfile-"%%PREFIX%%/etc/mail/greylist.conf"}
miltergreylist_flags=${miltergreylist_flags-"-P $miltergreylist_pidfile \
-f $miltergreylist_cfgfile -p $miltergreylist_sockfile -u $miltergreylist_runas"}

command="%%PREFIX%%/libexec/milter-greylist"

run_rc_command "$1"
