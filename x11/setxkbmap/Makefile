PORTNAME=	setxkbmap
PORTVERSION=	1.3.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the keyboard using the X Keyboard Extension

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg xorg-cat:app
USE_XORG=	xkbfile x11

CONFIGURE_ARGS=	--with-xkb-config-root=${LOCALBASE}/share/X11/xkb

PLIST_FILES=	bin/setxkbmap man/man1/setxkbmap.1.gz

.include <bsd.port.mk>
