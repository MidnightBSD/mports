PORTNAME=	${MPORTNAME:tl}
PORTVERSION=	8.2.1
CATEGORIES=	math

COMMENT=	Graph algorithms in the language of linear algebra
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=	Apache-2.0

USES=		localbase:ldflags

MPORTNAME=	GraphBLAS
CMAKE_ARGS+=	-DNSTATIC:BOOL=false
USE_LDCONFIG=	yes

PORTDOCS=	CSC20_OpenMP_GraphBLAS.pdf Davis_HPEC18.pdf	\
		GraphBLAS_API_C_2.0.0.pdf GraphBLAS_API_C_v13.pdf	\
		GraphBLAS_UserGuide.pdf HPEC19.pdf	\
		HPEC20_Python_and_MATLAB.pdf lagraph-grapl19.pdf	\
		toms_graphblas.pdf toms_parallel_grb2.pdf	\
		The_GraphBLAS_in_Julia_and_Python_the_PageRank_and_Triangle_Centralities.pdf

.include "${.CURDIR}/../../math/suitesparse/bsd.suitesparse.mk"

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${BUILD_WRKSRC}/Doc/${doc} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.post.mk>
