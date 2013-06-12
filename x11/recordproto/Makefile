# $MidnightBSD: mports/x11/recordproto/Makefile,v 1.3 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	recordproto
PORTVERSION=	1.14.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RECORD extension headers
LICENSE=	mit

XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/&$$/ \
		s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
