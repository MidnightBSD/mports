# $MidnightBSD: mports/x11/libXinerama/Makefile,v 1.6 2012/03/03 01:52:53 laffer1 Exp $

PORTNAME=	libXinerama
PORTVERSION=	1.1.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 Xinerama library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto xineramaproto:both
USE_AUTOTOOLS=	libtool

MAN3=		Xinerama.3 \
		XineramaQueryExtension.3 \
		XineramaQueryVersion.3 \
		XineramaIsActive.3 \
		XineramaQueryScreens.3

.include <bsd.port.mk>
