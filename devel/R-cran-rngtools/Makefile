PORTNAME=	rngtools
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility functions for working with Random Number Generators
WWW=		https://cran.r-project.org/web/packages/rngtools/

LICENSE=	gpl3

CRAN_DEPENDS=	R-cran-digest>0:security/R-cran-digest
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=	cran:auto-plist

NO_TEST=	yes

.include <bsd.port.mk>
