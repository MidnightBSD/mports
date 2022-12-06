PORTNAME=	xcursorgen
PORTVERSION=	1.0.8
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create an X cursor file from a collection of PNG images

LICENSE=	mit

LIB_DEPENDS=	libpng.so:graphics/png

USES=		xorg xorg-cat:app tar:xz
USE_XORG=	x11 xcursor xorgproto
INSTALL_TARGET=	install-strip

PLIST_FILES=	bin/xcursorgen man/man1/xcursorgen.1.gz

.include <bsd.port.mk>
