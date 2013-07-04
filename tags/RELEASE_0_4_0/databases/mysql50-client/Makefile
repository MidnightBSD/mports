# $MidnightBSD: mports/databases/mysql50-client/Makefile,v 1.2 2011/09/25 19:54:35 laffer1 Exp $

PORTNAME=	mysql
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)

MASTERDIR=	${.CURDIR}/../mysql50-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.client

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
