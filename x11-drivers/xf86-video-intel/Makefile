# $MidnightBSD: mports/x11-drivers/xf86-video-intel/Makefile,v 1.3 2008/03/28 07:39:20 ctriv Exp $

PORTNAME=	xf86-video-intel
PORTVERSION=	2.5.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for Intel integrated graphics chipsets
LICENSE=	x11

ONLY_FOR_ARCHS=	amd64 i386
USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	xvmc xineramaproto xextproto x11 xf86driproto glproto
MAN4=		i810.4x intel.4x

.include <bsd.port.mk>
