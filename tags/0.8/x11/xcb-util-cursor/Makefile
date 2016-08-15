# $MidnightBSD$
# $FreeBSD: head/x11/xcb-util-cursor/Makefile 384234 2015-04-18 15:34:36Z kwm $

PORTNAME=	xcb-util-cursor
PORTVERSION=	0.1.2
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XCB cursor library

LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:${PORTSDIR}/x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:${PORTSDIR}/x11/xcb-util-image
		
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:${PORTSDIR}/x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:${PORTSDIR}/x11/xcb-util-image

XORG_CAT=	lib
USE_XORG=	xcb
USES=		gmake gperf

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
