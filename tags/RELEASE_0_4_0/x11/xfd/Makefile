# $MidnightBSD: mports/x11/xfd/Makefile,v 1.3 2012/03/03 01:52:55 laffer1 Exp $

PORTNAME=	xfd
PORTVERSION=	1.1.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display all characters in an X font
LICENSE=	mit

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2
BUILD_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

XORG_CAT=	app
USE_XORG=	xft xt xaw

MAN1=		xfd.1

.include <bsd.port.mk>
