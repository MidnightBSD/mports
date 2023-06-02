PORTNAME=	setxkbmap
PORTVERSION=	1.3.4
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the keyboard using the X Keyboard Extension
WWW=		https://www.freedesktop.org/Software/xorg

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz xorg xorg-cat:app
USE_XORG=	xkbfile x11 xrandr

CONFIGURE_ARGS=	--with-xkb-config-root=${LOCALBASE}/share/X11/xkb

PLIST_FILES=	bin/setxkbmap man/man1/setxkbmap.1.gz

.include <bsd.port.mk>
