# $MidnightBSD: mports/x11/liboldX/Makefile,v 1.1 2007/10/05 19:59:53 ctriv Exp $

PORTNAME=	liboldX
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Old X library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

.include <bsd.port.mk>
