# $FreeBSD: ports/x11/scrnsaverproto/Makefile,v 1.1 2007/05/19 20:27:18 flz Exp $
# $MidnightBSD: mports/x11/scrnsaverproto/Makefile,v 1.2 2011/05/07 02:24:09 laffer1 Exp $

PORTNAME=	scrnsaverproto
PORTVERSION=	1.2.1
CATEGORIES=	mit

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ScrnSaver extension headers
LICENSE=	x11

XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
