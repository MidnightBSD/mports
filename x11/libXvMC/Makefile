PORTNAME=	libXvMC
PORTVERSION=	1.0.14
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Video Extension Motion Compensation library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe tar:xz xorg xorg-cat:lib
USE_XORG=	x11 xext xorgproto xv
CPE_VENDOR=	x
CPE_PRODUCT=	libxvmc

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
