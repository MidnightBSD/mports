# $MidnightBSD: mports/x11/xcb-util/Makefile,v 1.6 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	xcb-util
PORTVERSION=	0.3.9
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module with libxcb/libX11 extension/replacement libraries
LICENSE=	mit

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_XORG=	xau xcb xdmcp xorg-macros
USE_AUTOTOOLS=	libtool

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
