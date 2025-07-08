PORTNAME=	diffobj
DISTVERSION=	0.3.6
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diffs for R Objects
WWW=		https://cran.r-project.org/package=diffobj

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

BUILD_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr
RUN_DEPENDS=	R-cran-crayon>=1.3.2:devel/R-cran-crayon
TEST_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
