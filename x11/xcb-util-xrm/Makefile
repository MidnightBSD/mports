PORTNAME=	xcb-util-xrm
PORTVERSION=	1.0
CATEGORIES=	x11 devel
MASTER_SITES=	https://github.com/Airblader/xcb-util-xrm/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XCB utility functions for the X resource manager

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libxcb-util.so:x11/xcb-util

USES=		libtool pkgconfig tar:bzip2
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USE_XORG=	xcb
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e "s,/pkgconfig,data/pkgconfig,g" ${WRKSRC}/configure

.include <bsd.port.mk>
