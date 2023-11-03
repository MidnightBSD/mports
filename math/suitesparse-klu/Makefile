PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	2.2.1
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
CMAKE_ARGS+=	-DNSTATIC:BOOL=off

MPORTNAME=	KLU
USE_LDCONFIG=	yes

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/README.txt	\
		${FAKE_DESTDIR}${DOCSDIR}/${MPORTNAME}_README.txt
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/${MPORTNAME}_UserGuide.pdf	\
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
