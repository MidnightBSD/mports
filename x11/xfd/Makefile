# $FreeBSD: ports/x11/xfd/Makefile,v 1.1 2007/05/19 20:27:52 flz Exp $
# $MidnightBSD: mports/x11/xfd/Makefile,v 1.2 2011/05/07 14:36:54 laffer1 Exp $

PORTNAME=	xfd
PORTVERSION=	1.1.0
PORTREVISION=	1
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
