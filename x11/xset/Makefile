# $MidnightBSD$

PORTNAME=	xset
PORTVERSION=	1.2.4
PORTREVISION=	2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User preference utility for X

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg xorg-cat:app
USE_XORG=	xmuu x11 xext
CONFIGURE_ARGS=	--without-xf86misc \
		--without-fontcache

PLIST_FILES=	bin/xset man/man1/xset.1.gz
.include <bsd.port.mk>
