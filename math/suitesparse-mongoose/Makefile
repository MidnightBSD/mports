PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	3.2.1
CATEGORIES=	math

COMMENT=	Symmetric approximate minimum degree
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	gpl3

USES=		cmake:insource localbase:ldflags pathfix

MPORTNAME=	Mongoose
USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	mongoose # bin/mongoose

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/Mongoose_UserGuide.pdf	\
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
