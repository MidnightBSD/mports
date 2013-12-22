# $MidnightBSD$

PORTNAME=	xcb-util
PORTVERSION=	0.3.9
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module with libxcb/libX11 extension/replacement libraries

LICENSE=	mit

USE_BZIP2=	yes
USES=		gmake pathfix pkgconfig
USE_LDCONFIG=	yes
USE_XORG=	xau xcb xdmcp xorg-macros
USE_AUTOTOOLS=	libtool

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
