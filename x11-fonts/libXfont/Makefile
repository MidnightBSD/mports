# $MidnightBSD$

PORTNAME=	libXfont
PORTVERSION=	1.4.8
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font library

LICENSE=	bsd4

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2

XORG_CAT=	lib
USE_XORG=	xproto:both xtrans fontsproto:both fontenc

INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=--without-xmlto --disable-devel-docs

.include <bsd.port.mk>
