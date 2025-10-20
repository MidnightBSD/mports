PORTNAME=	patrick
DISTVERSION=	0.3.0
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension of the 'testthat' package
WWW=		https://cran.r-project.org/package=patrick

LICENSE=	Apache-2.0

RUN_DEPENDS=	R-cran-dplyr>0:math/R-cran-dplyr \
		R-cran-glue>0:devel/R-cran-glue \
		R-cran-purrr>0:devel/R-cran-purrr \
		R-cran-rlang>0:devel/R-cran-rlang \
		R-cran-testthat>=3.1.5:devel/R-cran-testthat \
		R-cran-tibble>0:devel/R-cran-tibble

USES=		cran:auto-plist

.include <bsd.port.mk>
