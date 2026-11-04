PORTNAME=	xpr
PORTVERSION=	1.2.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for printing an X window dump

LICENSE=	mit

meson_ARGS=
USES=		tar:xz xorg xorg-cat:app,meson
USE_XORG=	x11 xmuu xorgproto

PLIST_FILES=	bin/xdpr \
		bin/xpr \
		share/man/man1/xdpr.1.gz \
		share/man/man1/xpr.1.gz

.include <bsd.port.mk>
