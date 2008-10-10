# New ports collection makefile for:   nttcp
# Date created:        11 Nov 1998
# Whom:                Bill Fumerola <billf@chc-chimes.com>
#
# $MidnightBSD: mports/benchmarks/nttcp/Makefile,v 1.1 2007/07/15 08:11:51 laffer1 Exp $
# $FreeBSD: ports/benchmarks/nttcp/Makefile,v 1.16 2006/03/18 22:21:50 linimon Exp $
#

PORTNAME=	nttcp
PORTVERSION=	1.47
PORTREVISION=	1
CATEGORIES=	benchmarks net
MASTER_SITES=	\
		http://freeware.sgi.com/source/nttcp/ \
		http://reality.sgiweb.org/freeware/source/nttcp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A client/server program for testing network performance
LICENSE=	restricted

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
