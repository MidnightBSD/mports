# $MidnightBSD$

PORTNAME=	libXi
PORTVERSION=	1.7.9
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Input extension library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto x11 xext xextproto xfixes inputproto:both
INSTALL_TARGET=	install-strip
USES+=	cpe
CPE_PRODUCT=	libxi
CPE_VENDOR=	x

CONFIGURE_ARGS+=--disable-docs \
		--disable-specs \
		--without-xmlto \
		--without-fop \
		--without-asciidoc \
		--without-xsltproc

.include <bsd.port.mk>
