PORTNAME=	libXcomposite
PORTVERSION=	0.4.6
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Composite extension library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg xorg-cat:lib tar:xz
USE_XORG=	x11 xfixes xext xorgproto

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
