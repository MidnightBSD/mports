# $MidnightBSD: mports/x11/libXTrap/Makefile,v 1.2 2009/03/15 20:27:57 laffer1 Exp $

PORTNAME=	libXTrap
PORTVERSION=	1.0.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XTrap library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	trapproto:both x11 xext xextproto xt
USE_AUTOTOOLS=	libtool:22

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

.include <bsd.port.mk>
