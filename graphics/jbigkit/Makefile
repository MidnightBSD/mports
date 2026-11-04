PORTNAME=	jbigkit
PORTVERSION=	2.1
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	https://www.cl.cam.ac.uk/~mgk25/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lossless compression for bi-level images such as scanned pages, faxes
WWW=		https://www.cl.cam.ac.uk/~mgk25/jbigkit/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USE_LDCONFIG=	yes
MANS=		jbgtopbm.1 pbmtojbg.1
BINS=		jbgtopbm pbmtojbg jbgtopbm85 pbmtojbg85
LIBA=		libjbig.a libjbig85.a
LIBS=		libjbig.so.2 libjbig85.so.1
DOCSDIR?=	${PREFIX}/share/doc/jbig

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM}	\
		${BINS:S|^|${WRKSRC}/pbmtools/|} ${PREFIX}/bin

	${INSTALL_MAN}	\
		${MANS:S|^|${WRKSRC}/pbmtools/|} ${PREFIX}/share/man/man1

	${INSTALL_DATA} ${WRKSRC}/libjbig/*.h ${PREFIX}/include

	${INSTALL_DATA}	\
		${LIBA:S|^|${WRKSRC}/libjbig/|} ${PREFIX}/lib
	${INSTALL_LIB}	\
		${LIBS:S|^|${WRKSRC}/libjbig/|} ${PREFIX}/lib
	${LN} -sf libjbig.so.2 ${PREFIX}/lib/libjbig.so
	${LN} -sf libjbig85.so.1 ${PREFIX}/lib/libjbig85.so

	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/libjbig/jbig.txt ${DOCSDIR}

regression-test: do-test

do-test:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} LD_LIBRARY_PATH=${WRKSRC}/libjbig ${MAKE} test

.include <bsd.port.mk>
