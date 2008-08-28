# New ports collection makefile for:	xrx
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/xrx/Makefile,v 1.1 2007/05/19 20:28:12 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xrx
PORTVERSION=	1.0.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RX helper program
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 xt xext xtrans xproxymngproto xau xaw
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

MAN1=		xrx.1 libxrx.1

.include <bsd.port.mk>
