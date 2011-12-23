#!/bin/sh
#
# $MidnightBSD$
# $FreeBSD: ports/java/javavmwrapper/src/classpath.sh,v 1.2 2004/09/03 16:23:01 glewis Exp $

JAVALIBDIR=%%JAVALIBDIR%%

echo -n .
find -s ${JAVALIBDIR} -name '*.jar' | while read jar ; do
	echo -n ":${jar}"
done
