PORTNAME=	suitesparse
PORTVERSION=	7.3.1
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of packages for sparse matrix calculation
WWW=		https://faculty.cse.tamu.edu/davis/suitesparse.html

LICENSE=       gpl2 lgpl2.1
LICENSE_COMB=  dual

RUN_DEPENDS=	suitesparse-config>0:math/suitesparse-config		\
		suitesparse-amd>0:math/suitesparse-amd			\
		suitesparse-btf>0:math/suitesparse-btf			\
		suitesparse-camd>0:math/suitesparse-camd		\
		suitesparse-ccolamd>0:math/suitesparse-ccolamd		\
		suitesparse-colamd>0:math/suitesparse-colamd		\
		suitesparse-cholmod>0:math/suitesparse-cholmod		\
		suitesparse-cxsparse>0:math/suitesparse-cxsparse	\
		suitesparse-graphblas>0:math/suitesparse-graphblas	\
		suitesparse-klu>0:math/suitesparse-klu			\
		suitesparse-ldl>0:math/suitesparse-ldl			\
		suitesparse-mongoose>0:math/suitesparse-mongoose	\
		suitesparse-rbio>0:math/suitesparse-rbio		\
		suitesparse-spex>0:math/suitesparse-spex		\
		suitesparse-spqr>0:math/suitesparse-spqr		\
		suitesparse-umfpack>0:math/suitesparse-umfpack
.if !defined(PACKAGE_BUILDING)
RUN_DEPENDS+=	suitesparse-csparse>0:math/suitesparse-csparse
.endif

USES=		metaport

.include <bsd.port.mk>
