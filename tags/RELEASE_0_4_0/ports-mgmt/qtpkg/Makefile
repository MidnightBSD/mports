# New ports collection makefile for:	qtpkg
# Date created:				Wed Sep 19 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/ports-mgmt/qtpkg/Makefile,v 1.1 2007/09/20 01:41:01 laffer1 Exp $
#

PORTNAME=	qtpkg
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	ports-mgmt
DISTNAME=	qtpkg

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Qt based package removal tool
LICENSE=	bsd3

CFLAGS+=	${PTHREAD_CFLAGS}
MAKE_ENV=	LIBS="-lqt-mt ${PTHREAD_LIBS}"

PLIST_FILES=	sbin/qtpkg
USE_QT_VER=	3

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/qtpkg ${PREFIX}/sbin

.include <bsd.port.mk>
