# New ports collection makefile for:	mpeg2codec
#
# $FreeBSD: ports/multimedia/mpeg2codec/Makefile,v 1.12 2005/04/24 08:03:31 ahze Exp $
# $MidnightBSD: mports/multimedia/mpeg2codec/Makefile,v 1.3 2011/09/05 20:01:34 laffer1 Exp $
#

PORTNAME=	mpeg2codec
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	multimedia
MASTER_SITES=	\
		http://gd.tuwien.ac.at/graphics/libs/alsolibs/
DISTFILES=	mpeg2vidcodec_v12.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An MPEG-2 Encoder and Decoder
LICENSE=        other

USE_XORG=	xext
WRKSRC=		${WRKDIR}/mpeg2
DATADIR=	share/mpeg2
CFLAGS+=-DVERIFY -DVERBOSE -DTRACE

do-install:
.for i in dec enc
	${INSTALL_PROGRAM} ${WRKSRC}/src/mpeg2${i}/mpeg2${i}ode ${PREFIX}/bin
.endfor
	${MKDIR} ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/doc/mpeg2enc.doc ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/par/* ${PREFIX}/${DATADIR}

.include <bsd.port.mk>
