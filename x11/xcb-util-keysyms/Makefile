PORTNAME=	xcb-util-keysyms
PORTVERSION=	0.4.0
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard X key constants and conversion to/from keycodes
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit

LIB_DEPENDS=	libxcb-util.so:x11/xcb-util

USES=		gmake pkgconfig tar:bzip2 xorg xorg-cat:lib
USE_LDCONFIG=	yes
USE_XORG=	xcb xorg-macros
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd11.4

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
