PORTNAME=	libXfont
PORTVERSION=	1.5.4
PORTREVISION=	1
PORTEPOCH=	2
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font library

LICENSE=	mit bsd2 bsd3
LICENSE_COMB=	multi

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		cpe xorg xorg-cat:lib
XORG_CAT=	lib
USE_XORG=	xorgproto xtrans fontenc
INSTALL_TARGET=	install-strip
CPE_PRODUCT=	libxfont
CPE_VENDOR=	x

CONFIGURE_ARGS=--without-xmlto --disable-devel-docs

.include <bsd.port.mk>
