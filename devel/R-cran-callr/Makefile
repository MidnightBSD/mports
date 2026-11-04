PORTNAME=	callr
DISTVERSION=	3.7.6
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Call R from R
WWW=		https://callr.r-lib.org

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	R-cran-processx>=3.6.1:sysutils/R-cran-processx \
		R-cran-R6>0:devel/R-cran-R6

USES=		cran:auto-plist

# no test and no TEST_DEPENDS because of circular reference on testthat
NO_TEST=	yes

.include <bsd.port.mk>
