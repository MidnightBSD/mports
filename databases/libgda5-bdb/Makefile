# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	databases gnome
PKGNAMESUFFIX=	5-bdb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides Berkeley DB backend for the libgda5 library

LICENSE=	unknown

USE_BDB=	5
MASTERDIR=	${.CURDIR}/../libgda5
BUILD_WRKSRC=	${WRKSRC}/providers/bdb/
INSTALL_WRKSRC=	${BUILD_WRKSRC}
PLIST=		${.CURDIR}/pkg-plist

LIBGDA5_SLAVE=	bdb

.include "${MASTERDIR}/Makefile"
