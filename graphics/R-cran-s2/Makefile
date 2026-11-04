PORTNAME=	s2
DISTVERSION=	1.1.9
CATEGORIES=	graphics
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spherical Geometry Operators Using the S2 Geometry Library
WWW=		https://cran.r-project.org/web/packages/s2/

LICENSE=	Apache-2.0

CRAN_DEPENDS=	R-cran-Rcpp>0:devel/R-cran-Rcpp \
		R-cran-wk>=0.6.0:math/R-cran-wk
BUILD_DEPENDS=	${CRAN_DEPENDS}
LIB_DEPENDS=	libabsl_base.so:devel/abseil
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist,compiles pkgconfig ssl

.include <bsd.port.mk>
