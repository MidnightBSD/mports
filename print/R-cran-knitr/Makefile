PORTNAME=	knitr
DISTVERSION=	1.50
CATEGORIES=	print
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-Purpose Package for Dynamic Report Generation in R
WWW=		https://cran.r-project.org/package=knitr

LICENSE=	gpl2+

CRAN_DEPENDS=	R-cran-evaluate>=0.15:devel/R-cran-evaluate \
		R-cran-highr>=0.11:textproc/R-cran-highr \
		R-cran-xfun>=0.51:misc/R-cran-xfun \
		R-cran-yaml>=2.1.19:textproc/R-cran-yaml
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist

#circular
NO_TEST=	yes

.include <bsd.port.mk>
