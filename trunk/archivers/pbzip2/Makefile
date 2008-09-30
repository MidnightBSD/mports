# $MidnightBSD: mports/archivers/pbzip2/Makefile,v 1.3 2008/03/12 01:45:58 laffer1 Exp $

PORTNAME=	pbzip2
PORTVERSION=	1.0.2
CATEGORIES=	archivers
MASTER_SITES=	http://compression.ca/pbzip2/ CENKES

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parallel BZIP2
LICENSE=	bzip2
PLIST_FILES=	bin/pbzip2

MAN1=	pbzip2.1

post-patch:
	@${REINPLACE_CMD} \
		-e "s,-pthread -lpthread,${PTHREAD_LIBS},g" \
		-e "s,-O3,${CXXFLAGS}," \
		-e "s,^CC,#CC," \
		-e "s,CC,CXX," ${WRKSRC}/Makefile
	@${REINPLACE_CMD} \
		-e "s,PRIu64 \"Lu\",PRIu64 Lu," \
		-e "s,\"PRIu64\",#PRIu64,g" ${WRKSRC}/pbzip2.cpp

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MAN1PREFIX}/man/man1/

.include <bsd.port.mk>
