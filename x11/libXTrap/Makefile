# $MidnightBSD: mports/x11/libXTrap/Makefile,v 1.1 2007/10/05 15:17:27 ctriv Exp $

PORTNAME=	libXTrap
PORTVERSION=	1.0.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XTrap library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	trapproto:both x11 xext xextproto xt
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

.include <bsd.port.mk>
