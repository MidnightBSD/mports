PORTNAME=	xcb-util-cursor
PORTVERSION=	0.1.3
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XCB cursor library
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:x11/xcb-util-image

RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:x11/xcb-util-image

USES=		gmake gperf xorg xorg-cat:lib
USE_XORG=	xcb
INSTALL_TARGET=	install-strip

SSP_UNSAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
