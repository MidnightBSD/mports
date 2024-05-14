PORTNAME=	libXext
PORTVERSION=	1.3.6
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 Extension library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz cpe xorg xorg-cat:lib
USE_XORG=	x11 xau xorgproto
CPE_VENDOR=	x
CPE_PRODUCT=	libxext

CONFIGURE_ARGS+=--disable-specs --without-xmlto
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
