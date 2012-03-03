# $FreeBSD: ports/x11/xextproto/Makefile,v 1.1 2007/05/19 20:27:49 flz Exp $
# $MidnightBSD: mports/x11/xextproto/Makefile,v 1.4 2012/03/02 01:53:44 laffer1 Exp $

PORTNAME=	xextproto
PORTVERSION=	7.2.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XExt extension headers
LICENSE=	mit
	
XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs

post-patch:
	@${REINPLACE_CMD} '/^SUBDIR/s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
