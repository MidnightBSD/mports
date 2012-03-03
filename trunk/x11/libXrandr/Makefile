# New ports collection makefile for:   libXrandr
# Date Created:			9 Nov, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $FreeBSD: ports/x11/libXrandr/Makefile,v 1.13 2007/09/13 19:44:59 flz Exp $
# $MidnightBSD: mports/x11/libXrandr/Makefile,v 1.3 2009/05/04 02:15:03 laffer1 Exp $
#

PORTNAME=	libXrandr
PORTVERSION=	1.3.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Resize and Rotate extension library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 randrproto:both xext xextproto xrender renderproto xproto:both

MAN3=		Xrandr.3 \
		XRRConfigCurrentConfiguration.3 \
		XRRConfigCurrentRate.3 \
		XRRConfigRates.3 \
		XRRConfigRotations.3 \
		XRRConfigSizes.3 \
		XRRConfigTimes.3 \
		XRRFreeScreenConfigInfo.3 \
		XRRGetScreenInfo.3 \
		XRRQueryExtension.3 \
		XRRQueryVersion.3 \
		XRRRootToScreen.3 \
		XRRSelectInput.3 \
		XRRSetScreenConfig.3 \
		XRRSetScreenConfigAndRate.3

.include <bsd.port.mk>
