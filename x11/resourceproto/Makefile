# $MidnightBSD: mports/x11/resourceproto/Makefile,v 1.2 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	resourceproto
PORTVERSION=	1.2.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Resource extension headers
LICENSE=	mit

XORG_CAT=	proto

post-patch:
	@${REINPLACE_CMD} '/^install-data-am:/,/^$$/ \
		s/install-dist_docDATA//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
