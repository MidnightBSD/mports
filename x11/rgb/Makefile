# $MidnightBSD: mports/x11/rgb/Makefile,v 1.3 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	rgb
PORTVERSION=	1.0.5
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Uncompile an rgb corl-name database
LICENSE=	mit

CONFIGURE_ARGS=	--with-rgb-db-dir=${PREFIX}/lib/X11/rgb

XORG_CAT=	app
USE_XORG=	x11 xproto

PLIST_FILES=	bin/showrgb lib/X11/rgb.txt

MAN1=		showrgb.1

.include <bsd.port.mk>
