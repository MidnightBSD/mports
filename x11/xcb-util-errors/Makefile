PORTNAME=	xcb-util-errors
PORTVERSION=	1.0
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pretty-print XCB codes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xcb-proto>=1.6:x11/xcb-proto

USES=		xorg xorg-cat:lib
USE_XORG=	xcb
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
