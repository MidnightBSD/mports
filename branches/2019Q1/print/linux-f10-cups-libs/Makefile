# $MidightBSD$

PORTNAME=	cups-libs
PORTVERSION=	1.3.11
CATEGORIES=	print linux
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System libraries

LICENSE=	gpl2

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	gnutls
SRC_DISTFILES=	cups-${PORTVERSION}-${RPMVERSION}.src.rpm
RPMVERSION=	4.fc10
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libcups.so.2 usr/lib/libcupsimage.so.2
DESCR=		${.CURDIR}/../cups/pkg-descr

.include <bsd.port.mk>
