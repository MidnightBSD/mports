PORTNAME=	readxl
DISTVERSION=	1.4.5
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Read Excel Files
WWW=		https://cran.r-project.org/package=readxl

LICENSE=	mit

BUILD_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr \
		R-cran-cpp11>=0.4.0:devel/R-cran-cpp11 \
		R-cran-progress>0:devel/R-cran-progress
RUN_DEPENDS=	R-cran-cpp11>=0.4.0:devel/R-cran-cpp11 \
		R-cran-tibble>=2.0.1:devel/R-cran-tibble \
		R-cran-cellranger>0:textproc/R-cran-cellranger \
		R-cran-progress>0:devel/R-cran-progress
TEST_DEPENDS=	R-cran-testthat>0:devel/R-cran-testthat

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
