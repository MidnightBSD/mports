# $MidnightBSD: mports/x11/xinit/Makefile,v 1.4 2012/03/02 02:20:47 laffer1 Exp $

PORTNAME=	xinit
PORTVERSION=	1.3.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Window System initializer
LICENSE=	mit

XORG_CAT=	app
USE_XORG=	x11

PLIST_FILES=	bin/startx bin/xinit lib/X11/xinit/xinitrc
PLIST_DIRS=	lib/X11/xinit

MAN1=		startx.1 xinit.1

post-patch:
	@${REINPLACE_CMD} 's/test.*-traditional.*;/true;/' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|hexdump|/usr/bin/hexdump|' ${WRKSRC}/startx.cpp
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/man/xinit.man

.include <bsd.port.mk>
