PORTNAME=	hunspell
DISTVERSION=	3.0.6
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-Performance Stemmer, Tokenizer, and Spell Checker
WWW=		https://docs.ropensci.org/hunspell/

LICENSE=	gpl2 lgpl2.1 MPL11
LICENSE_COMB=	dual

RUN_DEPENDS=	R-cran-digest>0:security/R-cran-digest \
		R-cran-Rcpp>=0.12.12:devel/R-cran-Rcpp
TEST_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown \
		R-cran-spelling>0:textproc/R-cran-spelling \
		R-cran-testthat>0:devel/R-cran-testthat

USES=		cran:auto-plist,compiles

MAKE_ENV=	LC_ALL=C.UTF-8

TESTING_UNSAFE=	yes

.include <bsd.port.mk>
