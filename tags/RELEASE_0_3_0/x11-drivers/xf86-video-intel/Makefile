# $MidnightBSD: mports/x11-drivers/xf86-video-intel/Makefile,v 1.4 2009/03/16 14:35:46 laffer1 Exp $

PORTNAME=	xf86-video-intel
PORTVERSION=	2.7.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for Intel integrated graphics chipsets
LICENSE=	x11

ONLY_FOR_ARCHS=	amd64 i386
USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	xvmc xineramaproto xextproto x11 xf86driproto glproto
MAN4=		intel.4x

.include <bsd.port.mk>
