# $MidnightBSD: mports/x11/libXinerama/Makefile,v 1.1 2007/10/04 21:46:12 ctriv Exp $

PORTNAME=	libXinerama
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 Xinerama library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto xineramaproto:both
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

MAN3=		Xinerama.3 \
		XineramaQueryExtension.3 \
		XineramaQueryVersion.3 \
		XineramaIsActive.3 \
		XineramaQueryScreens.3

.include <bsd.port.mk>
