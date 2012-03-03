# $MidnightBSD: mports/x11/libXTrap/Makefile,v 1.5 2011/07/16 14:37:13 laffer1 Exp $

PORTNAME=	libXTrap
PORTVERSION=	1.0.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XTrap library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	trapproto:both x11 xext xextproto xt
USE_AUTOTOOLS=	libtool

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd7.0

.include <bsd.port.mk>
