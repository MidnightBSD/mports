PORTNAME=	maxLik
DISTVERSION=	1.5-2.2
CATEGORIES=	math
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Maximum Likelihood Estimation and Related Tools
WWW=		http://www.maxlik.org/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

BUILD_DEPENDS=	R-cran-miscTools>=0.6.8:math/R-cran-miscTools \
		R-cran-sandwich>=0:math/R-cran-sandwich \
		R-cran-generics>=0:devel/R-cran-generics
RUN_DEPENDS=	R-cran-miscTools>=0.6.8:math/R-cran-miscTools \
		R-cran-sandwich>=0:math/R-cran-sandwich \
		R-cran-generics>=0:devel/R-cran-generics

USES=		cran:auto-plist

.include <bsd.port.mk>
