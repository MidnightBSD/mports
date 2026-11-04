PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	3.2.1
CATEGORIES=	math

COMMENT=	Symmetric approximate minimum degree
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	bsd3

USES=		localbase:ldflags

MPORTNAME=	CAMD
USE_LDCONFIG=	yes

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${MPORTNAME}_README.txt
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/CAMD_UserGuide.pdf	\
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
