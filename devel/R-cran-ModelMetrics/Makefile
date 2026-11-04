PORTNAME=	ModelMetrics
PORTVERSION=	1.2.2.2
PORTREVISION=	3
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rapid Calculation of Model Metrics
WWW=		https://cran.r-project.org/web/packages/ModelMetrics/

LICENSE=	gpl2+

CRAN_DEPENDS=	R-cran-Rcpp>0:devel/R-cran-Rcpp \
		R-cran-data.table>0:devel/R-cran-data.table
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

# Rcpp's inlined code references backtrace_symbols(3); link libexecinfo so the
# resulting shared object can be loaded (see devel/R-cran-Rcpp).
MAKE_ENV+=	PKG_LIBS=-lexecinfo

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
