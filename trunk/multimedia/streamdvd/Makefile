# $MidnightBSD: mports/multimedia/streamdvd/Makefile,v 1.2 2009/05/27 21:26:39 crash Exp $

PORTNAME=	streamdvd
PORTVERSION=	0.4
PORTREVISION=	2
CATEGORIES=	multimedia
MASTER_SITES=	http://www.badabum.de/down/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast tool to backup Video DVDs 'on the fly'
LICENSE=        gpl2
LIB_DEPENDS=	dvdread.4:${PORTSDIR}/multimedia/libdvdread

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
