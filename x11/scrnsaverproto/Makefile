# $MidnightBSD: mports/x11/scrnsaverproto/Makefile,v 1.4 2012/03/04 18:47:10 laffer1 Exp $

PORTNAME=	scrnsaverproto
PORTVERSION=	1.2.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ScrnSaver extension headers
LICENSE=	mit

XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
