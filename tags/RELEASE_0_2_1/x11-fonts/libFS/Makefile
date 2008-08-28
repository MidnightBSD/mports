# New ports collection makefile for:	libFS
# Date Created:				21 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11-fonts/libFS/Makefile,v 1.1 2007/05/19 20:29:30 flz Exp $
# $MidnightBSD$
#

PORTNAME=	libFS
PORTVERSION=	1.0.0
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The FS library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	fontsproto:both xproto:both xtrans
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
