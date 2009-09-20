# New ports collection makefile for:	libXprintUtil
# Date Created:				21 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/libXprintUtil/Makefile,v 1.1 2007/05/19 20:26:54 flz Exp $
# $MidnightBSD: mports/x11/libXprintUtil/Makefile,v 1.1 2007/10/04 21:39:07 ctriv Exp $
#

PORTNAME=	libXprintUtil
PORTVERSION=	1.0.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XprintUtil library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	printproto:both x11 xau xp xt
USE_AUTOTOOLS=	libtool:22

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
