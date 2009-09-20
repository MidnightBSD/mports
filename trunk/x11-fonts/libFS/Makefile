# $MidnightBSD: mports/x11-fonts/libFS/Makefile,v 1.2 2009/03/15 20:42:33 laffer1 Exp $

PORTNAME=	libFS
PORTVERSION=	1.0.1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The FS library
LICENSE=	x11

XORG_CAT=	lib
USE_XORG=	fontsproto:both xproto:both xtrans
USE_AUTOTOOLS=	libtool:22

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

.include <bsd.port.mk>
