# $MidnightBSD$
# $FreeBSD: ports/x11/xcb-util-renderutil/Makefile,v 1.1 2012/01/15 12:46:10 garga Exp $

PORTNAME=	xcb-util-renderutil
PORTVERSION=	0.3.8
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenience functions for the Render extension

LICENSE=	mit

LIB_DEPENDS=	libxcb-util.so:${PORTSDIR}/x11/xcb-util

USES=		gmake pkgconfig tar:bzip2
USE_XORG=	xcb xorg-macros
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
