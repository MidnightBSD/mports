# $MidnightBSD: mports/x11-fonts/libFS/Makefile,v 1.5 2011/05/08 01:29:05 laffer1 Exp $

PORTNAME=	libFS
PORTVERSION=	1.0.3
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The FS library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	fontsproto:both xproto:both xtrans
USE_AUTOTOOLS=	libtool

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

.include <bsd.port.mk>
