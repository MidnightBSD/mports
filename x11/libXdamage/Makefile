PORTNAME=	libXdamage
PORTVERSION=	1.1.6
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Damage extension library
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg xorg-cat:lib tar:xz
USE_XORG=	x11 xfixes xorgproto

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
