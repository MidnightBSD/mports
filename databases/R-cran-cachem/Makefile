PORTNAME=	cachem
PORTVERSION=	1.1.0
CATEGORIES=	databases
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	port@MidnightBSD.org
COMMENT=	Cache R Objects with Automatic Pruning
WWW=		https://cran.r-project.org/web/packages/cachem/

LICENSE=	mit

CRAN_DEPENDS=	R-cran-fastmap>=1.2.0:databases/R-cran-fastmap \
		R-cran-rlang>0:devel/R-cran-rlang
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist,compiles

NO_TEST=	yes

.include <bsd.port.mk>
