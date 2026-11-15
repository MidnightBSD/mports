PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	2.3.0
CATEGORIES=	math

COMMENT=	Permutation to block triangular form
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	lgpl2.1+

USES=		localbase:ldflags

BUILD_DEPENDS=	suitesparse-config>=7.4.0:math/suitesparse-config

MPORTNAME=	BTF
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

PLIST_FILES+=	share/licenses/${PKGNAME}/UPSTREAM-NOTICE

post-fake:
	@${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}
	${INSTALL_DATA} ${CONFIGURE_WRKSRC}/Doc/License.txt \
		${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}/UPSTREAM-NOTICE

.include <bsd.port.post.mk>
