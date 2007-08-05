# New ports collection makefile for:    MySQL-scripts
# Date created:         Mon Feb 23 15:01:35 CET 2004
# Whom:                 Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/mysql50-scripts/Makefile,v 1.7 2006/03/17 07:06:38 ale Exp $
#

PORTNAME=	mysql
PKGNAMESUFFIX=	-scripts

COMMENT=	Multithreaded SQL database (scripts)

MASTERDIR=	${.CURDIR}/../mysql50-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.scripts

SCRIPTS_ONLY=	yes

.include "${MASTERDIR}/Makefile"
