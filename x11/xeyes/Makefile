PORTNAME=	xeyes
PORTVERSION=	1.3.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Follow the mouse X demo

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz xorg xorg-cat:app
USE_XORG=	x11 xcb xi xt xext xmu xrender

PLIST_FILES=	bin/xeyes share/man/man1/xeyes.1.gz

.include <bsd.port.mk>
