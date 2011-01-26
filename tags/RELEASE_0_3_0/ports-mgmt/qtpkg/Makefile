# New ports collection makefile for:	qtpkg
# Date created:				Wed Sep 19 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	qtpkg
PORTVERSION=	1.0
CATEGORIES=	ports-mgmt
DISTNAME=	qtpkg

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Qt based package removal tool
LICENSE=	bsd3

MAKE_ENV=	LIBS="-lqt-mt ${PTHREAD_LIBS}" CFLAGS="${PTHREAD_CFLAGS}"

PLIST_FILES=	sbin/qtpkg
USE_QT_VER=	3
USE_XLIB=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/qtpkg ${PREFIX}/sbin

.include <bsd.port.mk>
