#! /bin/sh
#
# $FreeBSD: ports/devel/antlr/files/antlr.sh,v 1.4 2004/11/15 23:59:52 glewis Exp $

JAVA_VERSION="%%JAVA_VERSION%%" "%%LOCALBASE%%/bin/java" -classpath "%%JAVAJARDIR%%/antlr.jar" antlr.Tool "$@"
