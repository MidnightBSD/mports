PORTNAME=	latticeExtra
DISTVERSION=	0.6-30
CATEGORIES=	graphics
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extra graphical utilities based on lattice
WWW=		https://cran.r-project.org/web/packages/latticeExtra/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

CRAN_DEPENDS=	R-cran-png>0:graphics/R-cran-png \
		R-cran-jpeg>0:graphics/R-cran-jpeg \
		R-cran-RColorBrewer>0:graphics/R-cran-RColorBrewer \
		R-cran-interp>0:devel/R-cran-interp
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist

.include <bsd.port.mk>
