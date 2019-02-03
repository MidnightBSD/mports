# $MidnightBSD$

PORTNAME=	xset
PORTVERSION=	1.2.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User preference utility for X

LICENSE=	mit

XORG_CAT=	app
USE_XORG=	xmuu xproto x11 xext xfontcache
CONFIGURE_ARGS=	--without-xf86misc

PLIST_FILES=	bin/xset man/man1/xset.1.gz

.include <bsd.port.mk>
