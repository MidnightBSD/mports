# $MidnightBSD: mports/x11/xrx/Makefile,v 1.1 2007/10/08 15:53:02 ctriv Exp $

PORTNAME=	xrx
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RX helper program
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 xt xext xtrans xproxymngproto xau xaw
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

MAN1=		xrx.1 libxrx.1

.include <bsd.port.mk>
