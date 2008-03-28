# New ports collection makefile for:	xf86-video-intel
# Date Created:				28 May 2007
# Whom:					lesi@FreeBSD.org
#
# $FreeBSD: ports/x11-drivers/xf86-video-intel/Makefile,v 1.3 2007/09/13 19:44:49 flz Exp $
# $MidnightBSD: mports/x11-drivers/xf86-video-intel/Makefile,v 1.2 2007/11/13 17:15:48 laffer1 Exp $
#

PORTNAME=	xf86-video-intel
PORTVERSION=	2.2.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for Intel integrated graphics chipsets
LICENSE=	x11

CONFLICTS=	xf86-video-i810-[0-9]*

ONLY_FOR_ARCHS=	amd64 i386
USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	xvmc xineramaproto xextproto x11 xf86driproto glproto
MAN4=		i810.4x intel.4x

.include <bsd.port.mk>
