# New ports collection makefile for:    MySQL-scripts
# Date created:         Mon Feb 23 15:01:35 CET 2004
# Whom:                 Alex Dupre <ale@FreeBSD.org>
#
# $FreeBSD: ports/databases/mysql41-scripts/Makefile,v 1.7 2006/05/06 20:52:55 pav Exp $
# $MidnightBSD$
#

PORTNAME=	mysql
PORTREVISION=	0
PKGNAMESUFFIX=	-scripts

COMMENT=	Multithreaded SQL database (scripts)

MASTERDIR=	${.CURDIR}/../mysql41-server

PKGINSTALL=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.scripts

SCRIPTS_ONLY=	yes

.include "${MASTERDIR}/Makefile"
