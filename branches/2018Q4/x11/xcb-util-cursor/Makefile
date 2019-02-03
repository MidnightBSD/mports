# $MidnightBSD$
# $FreeBSD: head/x11/xcb-util-cursor/Makefile 384234 2015-04-18 15:34:36Z kwm $

PORTNAME=	xcb-util-cursor
PORTVERSION=	0.1.3
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XCB cursor library

LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:x11/xcb-util-image

RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:x11/xcb-util-image

XORG_CAT=	lib
USE_XORG=	xcb
INSTALL_TARGET=	install-strip
USES=		gmake gperf

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
