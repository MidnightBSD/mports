PORTNAME=	rex
DISTVERSION=	1.2.1
PORTREVISION=	1
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Friendly Regular Expressions
WWW=		https://github.com/kevinushey/rex

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr
RUN_DEPENDS=	R-cran-lazyeval>0:math/R-cran-lazyeval
TEST_DEPENDS=	R-cran-Hmisc>0:devel/R-cran-Hmisc \
		R-cran-covr>0:devel/R-cran-covr \
		R-cran-magrittr>0:devel/R-cran-magrittr \
		R-cran-roxygen2>0:devel/R-cran-roxygen2 \
		R-cran-testthat>0:devel/R-cran-testthat \
		R-cran-ggplot2>0:graphics/R-cran-ggplot2 \
		R-cran-dplyr>0:math/R-cran-dplyr \
		R-cran-knitr>0:print/R-cran-knitr \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown \
		R-cran-stringr>0:textproc/R-cran-stringr \
		R-cran-rvest>0:www/R-cran-rvest

USES=		cran:auto-plist

.include <bsd.port.mk>
