# $MidnightBSD$

PORTNAME=	libXext
PORTVERSION=	1.3.3
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 Extension library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto x11 xextproto:both xau
CONFIGURE_ARGS+=--disable-specs --without-xmlto
INSTALL_TARGET=	install-strip
USES+=	cpe
CPE_PRODUCT=	libxext
CPE_VENDOR=	x

.include <bsd.port.mk>
