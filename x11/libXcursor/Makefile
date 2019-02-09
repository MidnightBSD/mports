# $MidnightBSD$

PORTNAME=	libXcursor
PORTVERSION=	1.1.15
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X client-side cursor loading library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xrender x11 xfixes xorgproto
USES+=	cpe
CPE_PRODUCT=	libxcursor
CPE_VENDOR=	x

CONFIGURE_ARGS=	--with-icondir=${PREFIX}/share/icons
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
