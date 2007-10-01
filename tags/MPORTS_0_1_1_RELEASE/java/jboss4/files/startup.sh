#!/bin/sh
#
# %%APP_TITLE%% startup script.
#
# $FreeBSD: ports/java/jboss4/files/startup.sh,v 1.4 2006/06/13 17:43:14 glewis Exp $
#

# PROVIDE: %%APP_SHORTNAME%%
# REQUIRE: NETWORKING SERVERS

# Add the following lines to /etc/rc.conf to enable %%APP_SHORTNAME%%:
# %%APP_SHORTNAME%%_enable (bool):		Set to "NO" by default.
#				Set it to "YES" to enable %%APP_SHORTNAME%%
# %%APP_SHORTNAME%%_flags (str):		Set to "-server" by default.
#				Extra JVM flags.
# %%APP_SHORTNAME%%_config (str):		Set to "" by default
#				JBoss server config, eg {all|default|minimal|standard}
#
. %%RC_SUBR%%

name="%%APP_SHORTNAME%%"
rcvar=`set_rcvar`

start_cmd="%%APP_SHORTNAME%%_start"
restart_cmd="%%APP_SHORTNAME%%_restart"
pidfile="%%PID_FILE%%"
procname="%%JAVA%%"

[ -z "$%%APP_SHORTNAME%%_enable" ]	&& %%APP_SHORTNAME%%_enable="NO"
[ -z "$%%APP_SHORTNAME%%_flags" ]	&& %%APP_SHORTNAME%%_flags="-server"
[ -z "$%%APP_SHORTNAME%%_config" ]	&& %%APP_SHORTNAME%%_config=""

%%APP_SHORTNAME%%_start ()
{
	checkyesno %%APP_SHORTNAME%%_enable &&
	{
		if [ ! -f ${pidfile} ]
		then
			touch ${pidfile}
			chown %%USER%%:%%GROUP%% ${pidfile}
		fi

		echo "Starting %%APP_SHORTNAME%%."
		%%CONTROL_SCRIPT%% -q ${%%APP_SHORTNAME%%_flags} ${%%APP_SHORTNAME%%_configflag} ${%%APP_SHORTNAME%%_config} start
	}
}

%%APP_SHORTNAME%%_restart ()
{
	checkyesno %%APP_SHORTNAME%%_enable &&
	{
		echo "Restarting %%APP_SHORTNAME%%."
		%%CONTROL_SCRIPT%% -q ${%%APP_SHORTNAME%%_flags} ${%%APP_SHORTNAME%%_configflag} ${%%APP_SHORTNAME%%_config} restart
	}
}

load_rc_config $name

[ -n "${%%APP_SHORTNAME%%_config}" ] && %%APP_SHORTNAME%%_configflag="-config"

run_rc_command "$1"
