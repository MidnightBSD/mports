# $MidnightBSD: mports/x11/xauth/Makefile,v 1.4 2011/07/16 15:58:08 laffer1 Exp $

PORTNAME=	xauth
PORTVERSION=	1.0.6
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X authority file utility
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 xau xext xmuu

CONFIGURE_TARGET=--build=${ARCH}-portbld-freebsd7.0

PLIST_FILES=	bin/xauth

MAN1=		xauth.1

.include <bsd.port.mk>
