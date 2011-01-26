# $MidnightBSD: mports/x11/libXtst/Makefile,v 1.2 2009/03/14 20:29:06 laffer1 Exp $

PORTNAME=	libXtst
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Test extension
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11 xext recordproto:both xextproto inputproto
USE_AUTOTOOLS=	libtool:22

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

MAN3=		XTestQueryExtension.3 \
		XTestCompareCursorWithWindow.3 \
		XTestCompareCurrentCursorWithWindow.3 \
		XTestFakeKeyEvent.3 \
		XTestFakeButtonEvent.3 \
		XTestFakeMotionEvent.3 \
		XTestFakeRelativeMotionEvent.3 \
		XTestGrabControl.3 \
		XTestSetGContextOfGC.3 \
		XTestSetVisualIDOfVisual.3 \
		XTestDiscard.3

.include <bsd.port.mk>
