# New ports collection makefile for:	MySQL-client
#
# $MidnightBSD: mports/databases/mysql50-client/Makefile,v 1.1 2006/10/03 20:52:30 laffer1 Exp $
# $FreeBSD: ports/databases/mysql50-client/Makefile,v 1.95 2006/03/17 07:06:38 ale Exp $
#

PORTNAME=	mysql
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)

MASTERDIR=	${.CURDIR}/../mysql50-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.client

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
