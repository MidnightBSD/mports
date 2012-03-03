# $MidnightBSD: mports/x11/xcmiscproto/Makefile,v 1.3 2011/05/07 02:48:07 laffer1 Exp $
#

PORTNAME=	xcmiscproto
PORTVERSION=	1.2.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XCMisc extension headers
LICENSE=	x11

XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS =/,/^$$/ s/specs//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
