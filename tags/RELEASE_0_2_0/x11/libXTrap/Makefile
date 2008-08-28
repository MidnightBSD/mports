# New ports collection makefile for:	libXTrap
# Date Created:				21 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/libXTrap/Makefile,v 1.1 2007/05/19 20:26:47 flz Exp $
# $MidnightBSD$
#

PORTNAME=	libXTrap
PORTVERSION=	1.0.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XTrap library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	trapproto:both x11 xext xextproto xt
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
