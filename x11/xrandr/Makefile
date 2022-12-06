PORTNAME=	xrandr
PORTVERSION=	1.5.2
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Primitive command line interface to the RandR extension

LICENSE=	mit

USES=		tar:xz xorg xorg-cat:app tar:xz
USE_XORG=	xrandr xrender x11

PLIST_FILES=	bin/xrandr \
		bin/xkeystone \
		man/man1/xrandr.1.gz

.include <bsd.port.mk>
