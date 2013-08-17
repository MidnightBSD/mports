# $MidnightBSD: mports/databases/mysql51-client/Makefile,v 1.3 2009/09/24 01:37:42 laffer1 Exp $

PORTNAME=	mysql
PKGNAMESUFFIX=	51-client

COMMENT=	Multithreaded SQL database (client)
LICENSE=	gpl2

MASTERDIR=	${.CURDIR}/../mysql51-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.client

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
