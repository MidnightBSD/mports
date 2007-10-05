# New ports collection makefile for:	liboldX
# Date Created:				Dec 16 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/liboldX/Makefile,v 1.1 2007/05/19 20:27:01 flz Exp $
# $MidnightBSD$
#

PORTNAME=	liboldX
PORTVERSION=	1.0.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Old X library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	x11
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
