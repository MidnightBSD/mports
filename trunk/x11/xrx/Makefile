# $MidnightBSD: mports/x11/xrx/Makefile,v 1.4 2011/02/02 21:35:02 laffer1 Exp $

PORTNAME=	xrx
PORTVERSION=	1.0.3
PORTREVISION=	0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RX helper program
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 xt xext xtrans xproxymngproto xau xaw
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

MAN1=		xrx.1 libxrx.1

.include <bsd.port.mk>
