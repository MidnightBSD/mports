# $FreeBSD: ports/x11/scrnsaverproto/Makefile,v 1.1 2007/05/19 20:27:18 flz Exp $
# $MidnightBSD: mports/x11/scrnsaverproto/Makefile,v 1.3 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	scrnsaverproto
PORTVERSION=	1.2.1
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
