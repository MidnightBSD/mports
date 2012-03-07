# $MidnightBSD$
# $FreeBSD: ports/x11/xcb-util-renderutil/Makefile,v 1.1 2012/01/15 12:46:10 garga Exp $

PORTNAME=	xcb-util-renderutil
PORTVERSION=	0.3.8
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenience functions for the Render extension
LICENSE=	mit

LIB_DEPENDS=	xcb.2:${PORTSDIR}/x11/libxcb \
		xcb-util.0:${PORTSDIR}/x11/xcb-util

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
#USE_XORG=	xau xdmcp
#USE_AUTOTOOLS=	libtool

GNU_CONFIGURE=	yes
#CONFIGURE_ENV=	GPERF="${LOCALBASE}/bin/gperf"

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
