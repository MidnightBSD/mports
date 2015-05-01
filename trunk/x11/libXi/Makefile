# $MidnightBSD$

PORTNAME=	libXi
PORTVERSION=	1.7.1
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Input extension library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto x11 xext xextproto xfixes inputproto:both

CONFIGURE_ARGS+=--disable-docs \
		--disable-specs \
	       	--without-xmlto \
		--without-fop \
		--without-asciidoc \
		--without-xsltproc

.include <bsd.port.mk>
