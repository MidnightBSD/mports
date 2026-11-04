PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	2.2.1
CATEGORIES=	math

COMMENT=	Sparse Left-looking Integer-Preserving LU Factorization
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	gpl2+ lgpl3+
LICENSE_COMB=	dual
LICENSE_FILE=	${BUILD_WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libgmp.so:math/gmp	\
		libmpfr.so:math/mpfr	\
		libamd.so:math/suitesparse-amd	\
		libcolamd.so:math/suitesparse-colamd

USES=		localbase:ldflags

MPORTNAME=	SPEX
USE_LDCONFIG=	yes

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.md	\
		${FAKE_DESTDIR}${DOCSDIR}/${MPORTNAME}_README.md
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/${MPORTNAME}_UserGuide.pdf	\
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
