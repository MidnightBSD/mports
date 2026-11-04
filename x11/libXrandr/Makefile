PORTNAME=	libXrandr
PORTVERSION=	1.5.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Resize and Rotate extension library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz cpe xorg xorg-cat:lib
USE_XORG=	x11 xext xrender xorgproto
CPE_VENDOR=	x
CPE_PRODUCT=	libxrandr

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
