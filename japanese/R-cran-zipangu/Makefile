PORTNAME=	zipangu
PORTVERSION=	0.3.3
CATEGORIES=	japanese
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese Utility Functions and Data
WWW=		https://cran.r-project.org/web/packages/zipangu/

LICENSE=	mit

RUN_DEPENDS=	R-cran-arabic2kansuji>=0.1.0:converters/R-cran-arabic2kansuji \
		R-cran-dplyr>=0.8.3:math/R-cran-dplyr \
		R-cran-lifecycle>=0.1.0:devel/R-cran-lifecycle \
		R-cran-lubridate>=1.7.4:devel/R-cran-lubridate \
		R-cran-magrittr>=1.5:devel/R-cran-magrittr \
		R-cran-memoise>0:devel/R-cran-memoise \
		R-cran-purrr>=0.3.3:devel/R-cran-purrr \
		R-cran-rlang>=0.4.0:devel/R-cran-rlang \
		R-cran-stringi>=1.4.3:textproc/R-cran-stringi \
		R-cran-stringr>=1.4.0:textproc/R-cran-stringr \
		R-cran-tibble>=2.1.3:devel/R-cran-tibble

USES=		cran:auto-plist

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}R-cran-

.include <bsd.port.post.mk>
