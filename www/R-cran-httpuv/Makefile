PORTNAME=	httpuv
DISTVERSION=	1.6.16
CATEGORIES=	www
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP and WebSocket server library for R
WWW=		https://cran.r-project.org/package=httpuv

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

CRAN_DEPENDS=	R-cran-later>=0.8.0:devel/R-cran-later \
		R-cran-promises>0:devel/R-cran-promises \
		R-cran-R6>0:devel/R-cran-R6 \
		R-cran-Rcpp>=1.0.7:devel/R-cran-Rcpp
BUILD_DEPENDS=	${CRAN_DEPENDS}
LIB_DEPENDS=	libuv.so:devel/libuv
RUN_DEPENDS=	${CRAN_DEPENDS}
TEST_DEPENDS=	R-cran-curl>0:ftp/R-cran-curl \
		R-cran-testthat>0:devel/R-cran-testthat

USES=		cran:auto-plist,compiles pkgconfig

.include <bsd.port.mk>
