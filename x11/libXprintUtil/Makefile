# New ports collection makefile for:	libXprintUtil
# Date Created:				21 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/libXprintUtil/Makefile,v 1.1 2007/05/19 20:26:54 flz Exp $
# $MidnightBSD: mports/x11/libXprintUtil/Makefile,v 1.3 2011/02/02 21:35:02 laffer1 Exp $
#

PORTNAME=	libXprintUtil
PORTVERSION=	1.0.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XprintUtil library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	printproto:both x11 xau xp xt
USE_AUTOTOOLS=	libtool

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd7.0

.include <bsd.port.mk>
