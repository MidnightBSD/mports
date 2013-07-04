# $MidnightBSD: mports/benchmarks/nttcp/Makefile,v 1.3 2011/01/22 16:54:56 laffer1 Exp $

PORTNAME=	nttcp
PORTVERSION=	1.47
PORTREVISION=	2
CATEGORIES=	benchmarks net
MASTER_SITES=	http://freeware.sgi.com/source/nttcp/ \
		http://reality.sgiweb.org/freeware/source/nttcp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A client/server program for testing network performance
LICENSE=	restricted
# can be distributed but can't make money off it

ALL_TARGET=	nttcp
MAN1=		nttcp.1
PLIST_FILES=	bin/nttcp
USE_GMAKE=	yes
MAKE_ENV+=	OPT="${CFLAGS}"
NOPRECIOUSMAKEVARS=yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/nttcp ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/nttcp.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
