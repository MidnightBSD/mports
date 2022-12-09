PORTNAME=	libXxf86dga
PORTVERSION=	1.1.6
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X DGA Extension

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe xorg xorg-cat:lib tar:xz
USE_XORG=	x11 xext xorgproto
CPE_VENDOR=	x
CPE_PRODUCT=	libxxf86dga

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
