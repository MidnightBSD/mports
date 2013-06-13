# $MidnightBSD: mports/x11/videoproto/Makefile,v 1.2 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	videoproto
PORTVERSION=	2.3.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video extension headers
LICENSE=	mit

XORG_CAT=	proto

post-patch:
	@${REINPLACE_CMD} '/^install-data-am:/,/^$$/ \
		s/install-dist_docDATA//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
