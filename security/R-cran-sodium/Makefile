PORTNAME=	sodium
DISTVERSION=	1.4.0
CATEGORIES=	security
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	R bindings to libsodium
WWW=		https://cran.r-project.org/web/packages/sodium/

LICENSE=	mit

CRAN_DEPENDS=	libsodium>0:security/libsodium
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}
TEST_DEPENDS=	R-cran-knitr>0:print/R-cran-knitr \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
