PORTNAME=	libXi
DISTVERSION=	1.8
PORTEPOCH=	1
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Input extension library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit

USES=		cpe xorg xorg-cat:lib
CPE_VENDOR=	x.org
USE_XORG=	x11 xext xfixes xorgproto

INSTALL_TARGET=	install-strip

CONFIGURE_ARGS+=--disable-docs \
		--disable-specs \
		--without-xmlto \
		--without-fop \
		--without-asciidoc \
		--without-xsltproc

.include <bsd.port.mk>
