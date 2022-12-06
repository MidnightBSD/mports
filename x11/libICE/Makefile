PORTNAME=	libICE
PORTVERSION=	1.1.0
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Inter Client Exchange library for X11
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe xorg xorg-cat:lib tar:xz
USE_XORG=	xorgproto xtrans

CPE_VENDOR=	freedesktop

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
