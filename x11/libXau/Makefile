PORTNAME=	libXau
PORTVERSION=	1.0.11
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Authentication Protocol library for X11
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz xorg xorg-cat:lib
USE_XORG=	xorgproto

INSTALL_TARGET=	install-strip
TEST_TARGET=	check

.include <bsd.port.mk>
