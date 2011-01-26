# $MidnightBSD: mports/x11/liboldX/Makefile,v 1.2 2009/03/14 19:52:53 laffer1 Exp $

PORTNAME=	liboldX
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Old X library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11
USE_AUTOTOOLS=	libtool:22

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

.include <bsd.port.mk>
