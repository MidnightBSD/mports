PORTNAME=	R.utils
DISTVERSION=	2.13.0
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility functions useful developing R packages
WWW=		https://cran.r-project.org/package=R.utils

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

RUN_DEPENDS=	R-cran-R.methodsS3>0:devel/R-cran-R.methodsS3 \
		R-cran-R.oo>0:devel/R-cran-R.oo
TEST_DEPENDS=	R-cran-digest>=0.6.10:security/R-cran-digest

USES=		cran:auto-plist

.include <bsd.port.mk>
