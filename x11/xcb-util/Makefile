# $MidnightBSD: mports/x11/xcb-util/Makefile,v 1.5 2011/05/07 02:46:06 laffer1 Exp $

PORTNAME=	xcb-util
PORTVERSION=	0.3.8
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A module with libxcb/libX11 extension/replacement libraries
LICENSE=	mit

LIB_DEPENDS=	xcb.2:${PORTSDIR}/x11/libxcb
BUILD_DEPENDS=	${LOCALBASE}/bin/gperf:${PORTSDIR}/devel/gperf

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_XORG=	xau xdmcp
USE_AUTOTOOLS=	libtool

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	GPERF="${LOCALBASE}/bin/gperf"

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
