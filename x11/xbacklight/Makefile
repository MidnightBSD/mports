PORTNAME=	xbacklight
PORTVERSION=	1.2.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to adjust backlight brightness

LICENSE=	mit

LIB_DEPENDS=	libxcb-util.so:x11/xcb-util

USES=		tar:xz xorg xorg-cat:app
USE_XORG=	x11 xrender xrandr xcb

PLIST_FILES=	bin/xbacklight share/man/man1/xbacklight.1.gz

.include <bsd.port.mk>
