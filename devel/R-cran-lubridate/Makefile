PORTNAME=	lubridate
DISTVERSION=	1.9.4
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Make Dealing with Dates a Little Easier
WWW=		https://cran.r-project.org/web/packages/lubridate/

LICENSE=	gpl2+

CRAN_DEPENDS=	R-cran-generics>0:devel/R-cran-generics \
		R-cran-timechange>=0.1.1:devel/R-cran-timechange
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}
TEST_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr \
		R-cran-testthat>0:devel/R-cran-testthat

USES=		compiler:c++11-lang cran:auto-plist,compiles

.include <bsd.port.mk>
