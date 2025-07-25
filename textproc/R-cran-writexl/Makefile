PORTNAME=	writexl
DISTVERSION=	1.5.4
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Export Data Frames to Excel Format
WWW=		https://github.com/ropensci/writexl/

LICENSE=	bsd2

RUN_DEPENDS=	R-cran-spelling>=0:textproc/R-cran-spelling \
		R-cran-bit64>=0:devel/R-cran-bit64 \
		R-cran-readxl>=0:textproc/R-cran-readxl
TEST_DEPENDS=	R-cran-testthat>=0:devel/R-cran-testthat

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
