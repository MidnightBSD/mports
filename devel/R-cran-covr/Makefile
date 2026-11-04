PORTNAME=	covr
DISTVERSION=	3.6.4
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test Coverage for Packages
WWW=		https://covr.r-lib.org

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr
RUN_DEPENDS=	R-cran-jsonlite>0:converters/R-cran-jsonlite \
		R-cran-crayon>0:devel/R-cran-crayon \
		R-cran-withr>=1.0.2:devel/R-cran-withr \
		R-cran-digest>0:security/R-cran-digest \
		R-cran-rex>0:textproc/R-cran-rex \
		R-cran-yaml>0:textproc/R-cran-yaml \
		R-cran-httr>0:www/R-cran-httr

USES=		cran:auto-plist,compiles

# many ports depend on this one and dependencies for testing are massive.
# it's blocking with ciruclar dependencies
NO_TEST=	yes

.include <bsd.port.mk>
