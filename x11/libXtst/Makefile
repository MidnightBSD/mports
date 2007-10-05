# New ports collection makefile for:   libXtst
# Date Created:			8 Feb 2006
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $FreeBSD: ports/x11/libXtst/Makefile,v 1.3 2007/09/13 19:45:00 flz Exp $
# $MidnightBSD$
#

PORTNAME=	libXtst
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Test extension
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11 xext recordproto:both xextproto inputproto
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

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
