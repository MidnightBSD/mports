# $MidnightBSD: mports/x11/xcmiscproto/Makefile,v 1.4 2012/03/03 01:52:54 laffer1 Exp $
#

PORTNAME=	xcmiscproto
PORTVERSION=	1.2.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XCMisc extension headers
LICENSE=	mit

XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS =/,/^$$/ s/specs//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
