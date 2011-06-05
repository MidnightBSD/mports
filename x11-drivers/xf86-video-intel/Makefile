# $MidnightBSD: mports/x11-drivers/xf86-video-intel/Makefile,v 1.6 2011/05/07 21:26:40 laffer1 Exp $

PORTNAME=	xf86-video-intel
PORTVERSION=	2.7.1
PORTREVISION=	2
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
