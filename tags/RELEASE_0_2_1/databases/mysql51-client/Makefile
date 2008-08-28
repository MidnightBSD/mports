# New ports collection makefile for:	MySQL-client
# Date created:				28 Jan 2006
# Whom:					Alex Dupre <ale@FreeBSD.org>
#
# $FreeBSD: ports/databases/mysql51-client/Makefile,v 1.98 2006/05/23 21:25:06 ale Exp $
# $MidnightBSD: mports/databases/mysql51-client/Makefile,v 1.1 2006/11/05 15:44:11 laffer1 Exp $

PORTNAME=	mysql
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)
LICENSE=	gpl2

MASTERDIR=	${.CURDIR}/../mysql51-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.client

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
