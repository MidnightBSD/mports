# $MidnightBSD: mports/x11/xcalc/Makefile,v 1.3 2011/05/07 02:44:26 laffer1 Exp $

PORTNAME=	xcalc
PORTVERSION=	1.0.4.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific calculator for X

RUN_DEPENDS=	font-misc-misc>=1.1.2:${PORTSDIR}/x11-fonts/font-misc-misc \
				font-adobe-100dpi>=1.0.3:${PORTSDIR}/x11-fonts/font-adobe-100dpi \
				font-alias>=1.0.3:${PORTSDIR}/x11-fonts/font-alias \
				xbitmaps>=1.1.0:${PORTSDIR}/x11/xbitmaps

XORG_CAT=	app
USE_XORG=	xt xaw

MAN1=		xcalc.1

.include <bsd.port.mk>
