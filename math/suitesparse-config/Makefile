PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	${SSPVERSION}
CATEGORIES=	math

COMMENT=	Common library for SuiteSparse
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	gpl2+

MPORTNAME=	config
USE_LDCONFIG=	yes

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md	\
		${FAKE_DESTDIR}${DOCSDIR}/SuiteSparse_README.md
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${PORTNAME}_README.txt

.include <bsd.port.post.mk>
