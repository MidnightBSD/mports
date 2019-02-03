# $MidnightBSD$

PORTNAME=	libXfont2
PORTVERSION=	2.0.3
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font library

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:print/freetype2

XORG_CAT=	lib
USE_XORG=	xproto:both xtrans fontsproto:both fontenc
INSTALL_TARGET=	install-strip
#USES+=	cpe
#CPE_PRODUCT=	libxfont
#CPE_VENDOR=	x

CONFIGURE_ARGS=--without-xmlto --disable-devel-docs --without-fop

.include <bsd.port.mk>
