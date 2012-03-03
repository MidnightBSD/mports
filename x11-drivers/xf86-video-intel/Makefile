# $MidnightBSD: mports/x11-drivers/xf86-video-intel/Makefile,v 1.7 2011/06/05 01:54:57 laffer1 Exp $

PORTNAME=	xf86-video-intel
PORTVERSION=	2.7.1
PORTREVISION=	3
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for Intel integrated graphics chipsets
LICENSE=	mit

CONFLICTS=	xf86-video-i810-[0-9]*

ONLY_FOR_ARCHS=	amd64 i386
USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	xvmc xineramaproto xextproto x11 xf86driproto glproto
MAN4=		intel.4x

.include <bsd.port.mk>
