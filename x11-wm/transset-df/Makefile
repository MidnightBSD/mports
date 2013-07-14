# Ports collection makefile for:	transset-df
# Date created:				June 5, 2011
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/x11-wm/transset-df/Makefile,v 1.1 2011/06/05 16:17:11 laffer1 Exp $

PORTNAME=	transset-df
PORTVERSION=	6
CATEGORIES=	x11-wm
MASTER_SITES=	http://forchheimer.se/transset-df/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Make your windows transparent

LICENSE=	mit

ALL_TARGET=	transset-df
MAKE_ARGS=	CFLAGS="${CFLAGS}"
USE_XORG=	x11 xfixes xcomposite xrender xdamage
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/transset-df

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/transset-df ${PREFIX}/bin

.include <bsd.port.mk>
