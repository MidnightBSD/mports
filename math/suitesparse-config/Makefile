PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	7.4.0
CATEGORIES=	math

COMMENT=	Common library for SuiteSparse
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	bsd3
LICENSE_FILE=	${PORTSDIR}/Templates/Licenses/bsd3

MPORTNAME=	config
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
	${INSTALL_DATA} ${WRKSRC}/SuiteSparse_config/README.txt ${FAKE_DESTDIR}${TRUE_PREFIX}/share/licenses/${PKGNAME}/UPSTREAM-NOTICE

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md	\
		${FAKE_DESTDIR}${DOCSDIR}/SuiteSparse_README.md
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${PORTNAME}_README.txt

.include <bsd.port.post.mk>
