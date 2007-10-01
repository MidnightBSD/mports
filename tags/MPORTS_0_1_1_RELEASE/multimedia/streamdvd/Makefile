# New ports collection makefile for:	streamdvd
# Date created:				Fri Jul 22 18:30:01 EDT 2005
# Whom:					Serge Gagnon <serge.gagnon@b2b2c.ca>
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/streamdvd/Makefile,v 1.3 2007/04/05 06:03:22 koitsu Exp $
#

PORTNAME=	streamdvd
PORTVERSION=	0.4
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://www.badabum.de/down/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast tool to backup Video DVDs 'on the fly'

LIB_DEPENDS=	dvdread.5:${PORTSDIR}/multimedia/libdvdread

WRKSRC=		${WRKDIR}/StreamDVD-${PORTVERSION}

PLIST_FILES=	bin/streamdvd
PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} -e 's|g++ -g -Wall|${CXX} ${CXXFLAGS} -I${LOCALBASE}/include -L${LOCALBASE}/lib|' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|<getopt\.h>|<unistd.h>|' \
		${WRKSRC}/mplex/mplex.cpp ${WRKSRC}/streamdvd.c
	@${REINPLACE_CMD} -e 's|<stdint\.h>|<unistd.h>|' \
		${WRKSRC}/mplex/mjpeg_types.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/streamdvd ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}
.endif

.include <bsd.port.mk>
