# New ports collection makefile for:   libXinerama
# Date Created:			7 May, 2004
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $FreeBSD: ports/x11/libXinerama/Makefile,v 1.12 2007/07/02 17:09:53 lesi Exp $
# $MidnightBSD$
#

PORTNAME=	libXinerama
PORTVERSION=	1.0.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 Xinerama library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto xineramaproto:both
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

MAN3=		Xinerama.3 \
		XineramaQueryExtension.3 \
		XineramaQueryVersion.3 \
		XineramaIsActive.3 \
		XineramaQueryScreens.3

.include <bsd.port.mk>
