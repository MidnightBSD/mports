PORTNAME=	vroom
DISTVERSION=	1.6.5
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Read and Write Rectangular Text Data Quickly
WWW=		https://cran.r-project.org/web/packages/vroom/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

CRAN_DEPENDS=	R-cran-bit64>0:devel/R-cran-bit64 \
		R-cran-cli>=3.2.0:devel/R-cran-cli \
		R-cran-cpp11>=0.2.0:devel/R-cran-cpp11 \
		R-cran-crayon>0:devel/R-cran-crayon \
		R-cran-glue>0:devel/R-cran-glue \
		R-cran-hms>0:devel/R-cran-hms \
		R-cran-lifecycle>=1.0.3:devel/R-cran-lifecycle \
		R-cran-progress>=1.2.1:devel/R-cran-progress \
		R-cran-rlang>=0.4.2:devel/R-cran-rlang \
		R-cran-tibble>=2.0.0:devel/R-cran-tibble \
		R-cran-tidyselect>0:devel/R-cran-tidyselect \
		R-cran-tzdb>=0.1.1:devel/R-cran-tzdb \
		R-cran-vctrs>=0.2.0:devel/R-cran-vctrs \
		R-cran-withr>0:devel/R-cran-withr
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}
TEST_DEPENDS=	R-cran-testthat>0:devel/R-cran-testthat

USES=		compiler:c++11-lang cran:auto-plist,compiles shebangfix

SHEBANG_FILES=	inst/bench/*.sh

.include <bsd.port.mk>
