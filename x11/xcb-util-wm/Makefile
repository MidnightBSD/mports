PORTNAME=	xcb-util-wm
PORTVERSION=	0.4.2
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for window manager implementation
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libxcb-util.so:x11/xcb-util

USES=		gmake tar:xz pkgconfig xorg
USE_LDCONFIG=	yes
USE_XORG=	xcb xorg-macros
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
