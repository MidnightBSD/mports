PORTNAME=	tibble
PORTVERSION=	3.2.1
PORTREVISION=	1
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Data Frames
WWW=		https://cran.r-project.org/web/packages/tibble/

LICENSE=	mit

CRAN_DEPENDS=	R-cran-fansi>=0.4.0:devel/R-cran-fansi \
		R-cran-lifecycle>=1.0.0:devel/R-cran-lifecycle \
		R-cran-magrittr>0:devel/R-cran-magrittr \
		R-cran-pillar>=1.7.0:devel/R-cran-pillar \
		R-cran-pkgconfig>0:devel/R-cran-pkgconfig \
		R-cran-rlang>=1.0.2:devel/R-cran-rlang \
		R-cran-vctrs>=0.3.8:devel/R-cran-vctrs
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
