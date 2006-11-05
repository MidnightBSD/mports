# New ports collection makefile for:	MySQL-client
# Date created:				Fri Apr 11 10:06:26 CET 2003
# Whom:					Alex Dupre <sysadmin@alexdupre.com>
#
# $FreeBSD: ports/databases/mysql41-client/Makefile,v 1.94 2006/05/06 20:52:55 pav Exp $
# $MidnightBSD$
#

PORTNAME=	mysql
PORTREVISION=	0
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)

MASTERDIR=	${.CURDIR}/../mysql41-server

PKGINSTALL=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.client

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
