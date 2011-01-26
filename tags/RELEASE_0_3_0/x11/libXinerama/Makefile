# $MidnightBSD: mports/x11/libXinerama/Makefile,v 1.2 2009/03/14 22:11:38 laffer1 Exp $

PORTNAME=	libXinerama
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 Xinerama library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto xineramaproto:both
USE_AUTOTOOLS=	libtool:22

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

MAN3=		Xinerama.3 \
		XineramaQueryExtension.3 \
		XineramaQueryVersion.3 \
		XineramaIsActive.3 \
		XineramaQueryScreens.3

.include <bsd.port.mk>
