# $MidnightBSD$

PORTNAME=	xcb-util
PORTVERSION=	0.4.0
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module with libxcb/libX11 extension/replacement libraries

LICENSE=	mit

USES=		gmake libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_XORG=	xau xcb xdmcp xorg-macros

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
