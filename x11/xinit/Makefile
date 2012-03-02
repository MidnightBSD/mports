# $MidnightBSD: mports/x11/xinit/Makefile,v 1.3 2011/05/07 15:29:45 laffer1 Exp $

PORTNAME=	xinit
PORTVERSION=	1.3.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Window System initializer
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11

PLIST_FILES=	bin/startx bin/xinit lib/X11/xinit/xinitrc
PLIST_DIRS=	lib/X11/xinit

MAN1=		startx.1 xinit.1

post-patch:
	@${REINPLACE_CMD} -e 's|hexdump|/usr/bin/hexdump|' ${WRKSRC}/startx.cpp
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/man/xinit.man

.include <bsd.port.mk>
