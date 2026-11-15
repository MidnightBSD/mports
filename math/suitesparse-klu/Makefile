PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	2.3.0
CATEGORIES=	math

COMMENT=	Sparse LU factorization, for circuit simulation
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	lgpl2.1+

LIB_DEPENDS=	libamd.so:math/suitesparse-amd		\
		libbtf.so:math/suitesparse-btf		\
		libcamd.so:math/suitesparse-camd	\
		libcolamd.so:math/suitesparse-colamd	\
		libccolamd.so:math/suitesparse-ccolamd	\
		libcholmod.so:math/suitesparse-cholmod

USES=		localbase:ldflags

BUILD_RUN_DEPENDS=	suitesparse-amd>=3.3.0:math/suitesparse-amd \
		suitesparse-btf>=2.3.0:math/suitesparse-btf \
		suitesparse-camd>=3.3.0:math/suitesparse-camd \
		suitesparse-ccolamd>=3.3.0:math/suitesparse-ccolamd \
		suitesparse-cholmod>=5.1.0:math/suitesparse-cholmod \
		suitesparse-colamd>=3.3.0:math/suitesparse-colamd \
		suitesparse-config>=7.4.0:math/suitesparse-config

CMAKE_ARGS+=	-DNSTATIC:BOOL=off

MPORTNAME=	KLU
SSPVERSION=	7.4.0
DISTINFO_FILE=	${.CURDIR}/distinfo
CMAKE_ARGS+=	-DSUITESPARSE_INCLUDEDIR_POSTFIX:STRING=
USE_LDCONFIG=	yes

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

.undef OPENMP_CMAKE_BOOL_OFF
OPENMP_CMAKE_BOOL=	SUITESPARSE_USE_OPENMP

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${MPORTNAME}_README.txt
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/${MPORTNAME}_UserGuide.pdf	\
		${FAKE_DESTDIR}${DOCSDIR}

PLIST_FILES+=	share/licenses/${PKGNAME}/UPSTREAM-NOTICE

post-fake:
	@${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}
	${INSTALL_DATA} ${CONFIGURE_WRKSRC}/Doc/License.txt \
		${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}/UPSTREAM-NOTICE

.include <bsd.port.post.mk>
