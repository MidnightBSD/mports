# $MidnightBSD: mports/x11/libSM/Makefile,v 1.8 2012/03/02 01:47:10 laffer1 Exp $

PORTNAME=	libSM
PORTVERSION=	1.2.1
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session Management library for X11
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	ice xproto:both xtrans

CONFIGURE_ARGS+=--disable-docs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/doc//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
