PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	4.2.1
CATEGORIES=	math

COMMENT=	Read/write sparse matrices
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	gpl2+

USES=		localbase:ldflags

MPORTNAME=	RBio
USE_LDCONFIG=	yes

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${MPORTNAME}_README.txt

.include <bsd.port.post.mk>
