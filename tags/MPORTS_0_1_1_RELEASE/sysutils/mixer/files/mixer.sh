#!/bin/sh
# $FreeBSD: ports/sysutils/mixer/files/mixer.sh,v 1.1 2002/02/20 05:38:44 petef Exp $

MIXERSTATE=/var/db/mixer-state

case $1 in
start)
    [ -r $MIXERSTATE ] && /usr/sbin/mixer `cat $MIXERSTATE` > /dev/null
    ;;
stop)
    /usr/sbin/mixer -s > $MIXERSTATE
    ;;
*)
    echo "usage: `basename $0` {start|stop}" >&2
    exit 64
    ;;
esac
