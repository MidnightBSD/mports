# $MidnightBSD: mports/x11-drivers/xf86-input-mouse/Makefile,v 1.7 2012/03/03 22:02:31 laffer1 Exp $

PORTNAME=	xf86-input-mouse
PORTVERSION=	1.7.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org mouse input driver
LICENSE=	mit

CONFIGURE_ARGS+=--disable-silent-rules

XORG_CAT=	driver
USE_XORG=       xextproto videoproto
MAN4=		mousedrv.4x

.include <bsd.port.mk>
