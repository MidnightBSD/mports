# $MidnightBSD: mports/x11/libXdmcp/Makefile,v 1.7 2012/03/03 01:52:53 laffer1 Exp $

PORTNAME=	libXdmcp
PORTVERSION=	1.1.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Display Manager Control Protocol library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto:both

CONFIGURE_ARGS+=--disable-docs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/doc//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
