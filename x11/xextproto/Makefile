# $MidnightBSD: mports/x11/xextproto/Makefile,v 1.5 2012/03/03 01:52:55 laffer1 Exp $

PORTNAME=	xextproto
PORTVERSION=	7.2.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XExt extension headers
LICENSE=	mit
	
XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs

post-patch:
	@${REINPLACE_CMD} '/^SUBDIR/s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
