# Ports collection makefile for:  libnet
# Date created:			Sun Feb 3, 1999
# Whom:				shipley@dis.org
#
# $FreeBSD: ports/net/libnet10/Makefile,v 1.17 2005/11/15 06:50:28 ade Exp $
# $MidnightBSD: mports/net/libnet10/Makefile,v 1.2 2008/02/27 20:40:36 laffer1 Exp $
#

PORTNAME=	libnet
PORTVERSION=	1.0.2a
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	net
MASTER_SITES=	http://www.packetfactory.net/libnet/dist/
PKGNAMESUFFIX=	10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library for creating IP packets
LICENSE=	agg

CFLAGS+=	-fPIC
USE_AUTOTOOLS=	autoconf:261
WRKSRC=		${WRKDIR}/Libnet-${PORTVERSION}
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}
MAN3=		libnet${PKGNAMESUFFIX}.3

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/libnet.3 \
		${MANPREFIX}/man/man3/libnet${PKGNAMESUFFIX}.3
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/examples ${DOCSDIR}/ancillary
.for i in CHANGELOG CHANGELOG-NEWFUNCTIONS COPYING README TODO-1.0 TODO-1.1
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${DOCSDIR}
.endfor
.for i in README.asn.1 README.bpf README.legacy-applications README.libnet-config README.linux README.rawsockets
	${INSTALL_DATA} ${WRKSRC}/doc/Ancillary/${i} ${DOCSDIR}/ancillary
.endfor
.for i in libnet-example-1.c libnet-example-2.c libnet-example-3.c libnet-example-4.c
	${INSTALL_DATA} ${WRKSRC}/example/${i} ${DOCSDIR}/examples
.endfor
.endif

.include <bsd.port.mk>
