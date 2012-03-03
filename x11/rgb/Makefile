# $FreeBSD: ports/x11/rgb/Makefile,v 1.1 2007/05/19 20:27:14 flz Exp $
# $MidnightBSD: mports/x11/rgb/Makefile,v 1.2 2011/05/07 02:18:39 laffer1 Exp $

PORTNAME=	rgb
PORTVERSION=	1.0.4
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
