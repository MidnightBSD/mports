PORTNAME=	dplyr
DISTVERSION=	1.1.4
CATEGORIES=	math
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Grammar of Data Manipulation
WWW=		https://github.com/hadley/dplyr

LICENSE=	mit

BUILD_DEPENDS=	R-cran-assertthat>=0.2.0:math/R-cran-assertthat \
		R-cran-generics>=0:devel/R-cran-generics \
		R-cran-glue>=1.3.0:devel/R-cran-glue \
		R-cran-magrittr>=1.5:devel/R-cran-magrittr \
		R-cran-pkgconfig>0:devel/R-cran-pkgconfig \
		R-cran-R6>0:devel/R-cran-R6 \
		R-cran-Rcpp>=1.0.1:devel/R-cran-Rcpp \
		R-cran-rlang>=1.1.0:devel/R-cran-rlang \
		R-cran-tibble>=3.2.0:devel/R-cran-tibble \
		R-cran-tidyselect>=0.2.5:devel/R-cran-tidyselect \
		R-cran-BH>0:devel/R-cran-BH \
		R-cran-plogr>=0.2.0:devel/R-cran-plogr \
		R-cran-vctrs>=0.6.4:devel/R-cran-vctrs \
		R-cran-pillar>=1.9.0:devel/R-cran-pillar
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
