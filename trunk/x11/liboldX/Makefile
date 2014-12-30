# $MidnightBSD$

PORTNAME=	liboldX
PORTVERSION=	1.0.1
PORTREVISION=	3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Old X library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11

post-install:
	cd ${PREFIX}/lib && ${LN} -sf liboldX.so.6.0 liboldX.so

.include <bsd.port.mk>
