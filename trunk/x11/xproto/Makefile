# $MidnightBSD: mports/x11/xproto/Makefile,v 1.5 2012/03/03 01:52:56 laffer1 Exp $

PORTNAME=	xproto
PORTVERSION=	7.0.24
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 protocol headers
LICENSE=	mit

XORG_CAT=	proto
USE_PKGCONFIG=	yes

CONFIGURE_ARGS+=--disable-specs --without-fop --without-xmlto --without-xsltproc

.include <bsd.port.mk>
