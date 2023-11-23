PORTNAME=	xcb-proto
PORTVERSION=	1.16.0
CATEGORIES=	x11 python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnome python tar:xz xorg-cat:proto
USE_GNOME=	libxml2:build
USE_PYTHON=	py3kplist
NO_ARCH=	yes
MAKE_ARGS=	pkgconfigdir=${PREFIX}/libdata/pkgconfig

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
