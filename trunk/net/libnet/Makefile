# Ports collection makefile for:  libnet
# Date created:			Sun Feb 3, 1999
# Whom:				shipley@dis.org
#
# $MidnightBSD: mports/net/libnet/Makefile,v 1.2 2008/09/17 21:27:00 laffer1 Exp $
# $FreeBSD: ports/net/libnet/Makefile,v 1.16 2005/11/14 17:07:01 sem Exp $
#

PORTNAME=	libnet
PORTVERSION=	1.1.2.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	net
PKGNAMESUFFIX=	11
MASTER_SITES=	http://www.packetfactory.net/libnet/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library for creating IP packets
LICENSE=	agg

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
		--host=${ARCH}-portbld-freebsd6.0 \
		--target=${ARCH}-portbld-freebsd6.0

WRKSRC=		${WRKDIR}/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}
EXAMPLESDIR=	${PREFIX}/share/examples/${PORTNAME}${PKGNAMESUFFIX}

DOCS=		README doc/BUGS doc/CHANGELOG doc/CONTRIB doc/COPYING \
		doc/DESIGN_NOTES doc/MIGRATION doc/PACKET_BUILDING doc/PORTED \
		doc/RAWSOCKET_NON_SEQUITUR doc/TODO doc/html/*
EXAMPLES=	sample/*.c

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/libnet-config \
		${PREFIX}/bin/libnet${PKGNAMESUFFIX}-config
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${EXAMPLES} ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
