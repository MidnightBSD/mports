# $MidnightBSD$

PORTNAME=	videoproto
PORTVERSION=	2.3.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video extension headers
LICENSE=	mit

XORG_CAT=	proto

post-patch:
	@${REINPLACE_CMD} '/^install-data-am:/,/^$$/ \
		s/install-dist_docDATA//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
