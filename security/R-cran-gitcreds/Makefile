PORTNAME=	gitcreds
DISTVERSION=	0.1.2
PORTREVISION=	1
CATEGORIES=	security
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Query 'git' Credentials from 'R'
WWW=		https://gitcreds.r-lib.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr
TEST_DEPENDS=	R-cran-covr>0:devel/R-cran-covr \
		R-cran-mockery>0:devel/R-cran-mockery \
		R-cran-testthat>=3.0.0:devel/R-cran-testthat \
		R-cran-withr>0:devel/R-cran-withr \
		R-cran-knitr>0:print/R-cran-knitr \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown

USES=		cran:auto-plist

.include <bsd.port.mk>
