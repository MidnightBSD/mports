# $MidnightBSD: mports/x11/libdmx/Makefile,v 1.2 2011/05/03 13:41:30 laffer1 Exp $

PORTNAME=	libdmx
PORTVERSION=	1.1.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DMX extension library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto dmxproto:both

MAN3=		DMX.3 \
		DMXAddInput.3 \
		DMXAddScreen.3 \
		DMXChangeDesktopAttributes.3 \
		DMXChangeScreensAttributes.3 \
		DMXForceWindowCreation.3 \
		DMXGetDesktopAttributes.3 \
		DMXGetInputAttributes.3 \
		DMXGetInputCount.3 \
		DMXGetScreenAttributes.3 \
		DMXGetScreenCount.3 \
		DMXGetWindowAttributes.3 \
		DMXQueryExtension.3 \
		DMXQueryVersion.3 \
		DMXRemoveInput.3 \
		DMXRemoveScreen.3 \
		DMXSync.3

.include <bsd.port.mk>
