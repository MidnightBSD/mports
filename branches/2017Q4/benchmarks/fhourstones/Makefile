# $MidnightBSD$

PORTNAME=	fhourstones
PORTVERSION=	3.1
PORTREVISION=	2
CATEGORIES=	benchmarks
MASTER_SITES=	http://homepages.cwi.nl/~tromp/c4/
DISTNAME=	Fhourstones

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fhourstones Benchmark

LICENSE=	other

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/fhourstones lib/fhourstones/SearchGame lib/fhourstones/inputs
PLIST_DIRS=	lib/fhourstones

post-patch:
		@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/Makefile
		@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/fhourstones

do-install:
		${MKDIR} ${PREFIX}/lib/fhourstones
		${INSTALL_SCRIPT} ${WRKDIR}/fhourstones ${PREFIX}/bin
		${INSTALL_PROGRAM} ${WRKDIR}/SearchGame ${PREFIX}/lib/fhourstones/
		${INSTALL_DATA} ${WRKDIR}/inputs ${PREFIX}/lib/fhourstones

.include <bsd.port.mk>
