PORTNAME=	xfd
PORTVERSION=	1.1.4
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display all characters in an X font

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:print/freetype2
BUILD_DEPENDS=	fc-cache:x11-fonts/fontconfig
RUN_DEPENDS=	fc-cache:x11-fonts/fontconfig

USES=		xorg xorg-cat:app tar:xz
USE_XORG=	x11 xft xkbfile xmu xrender xt xaw

.include <bsd.port.mk>
