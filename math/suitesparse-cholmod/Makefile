PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	5.1.0
CATEGORIES=	math

COMMENT=	Sparse CHOLesky MODification package
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	gpl2+ lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+=	${PORTSDIR}/Templates/Licenses/gpl2
LICENSE_FILE_lgpl2.1+=	${PORTSDIR}/Templates/Licenses/lgpl2.1

BUILD_RUN_DEPENDS=	suitesparse-config>=7.4.0:math/suitesparse-config \
		suitesparse-amd>=3.3.0:math/suitesparse-amd \
		suitesparse-camd>=3.3.0:math/suitesparse-camd \
		suitesparse-ccolamd>=3.3.0:math/suitesparse-ccolamd \
		suitesparse-colamd>=3.3.0:math/suitesparse-colamd

LIB_DEPENDS=	libamd.so:math/suitesparse-amd		\
		libcamd.so:math/suitesparse-camd	\
		libcolamd.so:math/suitesparse-colamd	\
		libccolamd.so:math/suitesparse-ccolamd

USES=		localbase:ldflags

MPORTNAME=	CHOLMOD
USE_LDCONFIG=	yes

CMAKE_ARGS+=	-DSUITESPARSE_INCLUDEDIR_POSTFIX:STRING=

SSPVERSION=	7.4.0
DISTINFO_FILE=	${.CURDIR}/distinfo

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

OPENMP_CMAKE_BOOL=	SUITESPARSE_USE_OPENMP
.undef OPENMP_CMAKE_BOOL_OFF

PLIST_FILES+=	share/licenses/${PKGNAME}/UPSTREAM-NOTICE

post-fake:
	@${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}
	${INSTALL_DATA} ${CONFIGURE_WRKSRC}/Doc/License.txt ${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}/UPSTREAM-NOTICE

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${MPORTNAME}_README.txt
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/${MPORTNAME}_UserGuide.pdf	\
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
