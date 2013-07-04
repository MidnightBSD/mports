# $MidnightBSD: mports/x11/libXxf86misc/Makefile,v 1.3 2012/03/03 01:52:53 laffer1 Exp $

PORTNAME=	libXxf86misc
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X XF86-Misc Extension
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto x11 xextproto xext xf86miscproto:both

MAN3=		XF86Misc.3 \
		XF86MiscGetKbdSettings.3 \
		XF86MiscGetMouseSettings.3 \
		XF86MiscGetSaver.3 \
		XF86MiscQueryExtension.3 \
		XF86MiscQueryVersion.3 \
		XF86MiscSetKbdSettings.3 \
		XF86MiscSetMouseSettings.3 \
		XF86MiscSetSaver.3

.include <bsd.port.mk>
