# $FreeBSD: ports/x11/xextproto/Makefile,v 1.1 2007/05/19 20:27:49 flz Exp $
# $MidnightBSD: mports/x11/xextproto/Makefile,v 1.3 2011/05/07 03:00:21 laffer1 Exp $

PORTNAME=	xextproto
PORTVERSION=	7.2.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XExt extension headers
LICENSE=	x11
	
XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs

post-patch:
	@${REINPLACE_CMD} '/^SUBDIR/s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
