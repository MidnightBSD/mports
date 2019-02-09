# $MidnightBSD$

PORTNAME=	mkfontscale
PORTVERSION=	1.1.3
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Creates an index of scalable font files for X

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:print/freetype2

XORG_CAT=	app
USE_XORG=	xorgproto fontenc

CONFIGURE_ARGS+=--disable-maintainer-mode

.include <bsd.port.mk>
