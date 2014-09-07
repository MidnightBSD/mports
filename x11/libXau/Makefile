# $MidnightBSD$

PORTNAME=	libXau
PORTVERSION=	1.0.8
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Authentication Protocol library for X11

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto:both

post-install:
	${LN} -sf ${PREFIX}/lib/libXau.so.6 ${PREFIX}/lib/libXau.so.0

.include <bsd.port.mk>
