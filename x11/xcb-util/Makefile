PORTNAME=	xcb-util
PORTVERSION=	0.4.1
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module with libxcb/libX11 extension/replacement libraries
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz gmake libtool pathfix pkgconfig xorg xorg-cat:lib
USE_LDCONFIG=	yes
USE_XORG=	xau xcb xdmcp
INSTALL_TARGET=	install-strip

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
