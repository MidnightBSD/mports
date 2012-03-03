# $MidnightBSD: mports/x11/xdpyinfo/Makefile,v 1.4 2011/09/20 23:44:41 laffer1 Exp $

PORTNAME=	xdpyinfo
PORTVERSION=	1.2.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display information utility for X
LICENSE=	mit

XORG_CAT=	app
USE_XORG=	xext x11 xtst xxf86vm xxf86dga xi xrender \
		xinerama dmxproto xp
CONFIGURE_ARGS=	--without-xf86misc

PLIST_FILES=	bin/xdpyinfo

MAN1=		xdpyinfo.1

.include <bsd.port.mk>
