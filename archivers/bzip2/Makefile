PORTNAME=	bzip2
PORTVERSION=	1.0.8
PORTREVISION=	0
CATEGORIES=	archivers
MASTER_SITES=	https://sourceware.org/pub/bzip2/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Block-sorting file compressor

LICENSE=	bzip2

USES=		cpe
CPE_VENDOR=	bzip
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bzip2 ${PREFIX}/bin
	cd ${PREFIX}/bin/ && ${LN} -sf bzip2 bunzip2
	cd ${PREFIX}/bin/ && ${LN} -sf bzip2 bzcat
	cd ${PREFIX}/bin/ && ${LN} -sf bzip2 bz2cat
	${INSTALL_PROGRAM} ${WRKSRC}/bzip2recover ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bzgrep ${PREFIX}/bin
	cd ${PREFIX}/bin/ && ${LN} -sf bzgrep bzegrep
	cd ${PREFIX}/bin/ && ${LN} -sf bzgrep bzfgrep
	${INSTALL_SCRIPT} ${WRKSRC}/bzmore ${PREFIX}/bin
	cd ${PREFIX}/bin/ && ${LN} -sf bzmore bzless
	${INSTALL_DATA} ${WRKSRC}/bzlib.h ${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/libbz2.a ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/libbz2.so.1 ${PREFIX}/lib
	cd ${PREFIX}/lib && ${LN} -sf libbz2.so.1 libbz2.so
	${INSTALL_MAN} ${WRKSRC}/bzip2.1 ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/bzgrep.1 ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/bzmore.1 ${PREFIX}/share/man/man1
	${LN} -sf bzip2.1 ${STAGEDIR}${PREFIX}/share/man/man1/bunzip2.1
	${LN} -sf bzip2.1 ${STAGEDIR}${PREFIX}/share/man/man1/bzcat.1
	${LN} -sf bzip2.1 ${STAGEDIR}${PREFIX}/share/man/man1/bz2cat.1
	${LN} -sf bzip2.1 ${STAGEDIR}${PREFIX}/share/man/man1/bzip2recover.1
	${LN} -sf bzgrep.1 ${STAGEDIR}${PREFIX}/share/man/man1/bzegrep.1
	${LN} -sf bzgrep.1 ${STAGEDIR}${PREFIX}/share/man/man1/bzfgrep.1
	${LN} -sf bzmore.1 ${STAGEDIR}${PREFIX}/share/man/man1/bzless.1
	${MKDIR} ${PREFIX}/share/doc/bzip2
	${INSTALL_DATA} ${WRKSRC}/manual* ${PREFIX}/share/doc/bzip2
	${INSTALL_DATA} ${WRKSRC}/bzip2.txt ${PREFIX}/share/doc/bzip2
	${PREFIX}/bin/bzip2 -f ${PREFIX}/share/doc/bzip2/manual.ps

.include <bsd.port.mk>
