PORTNAME=	selectr
DISTVERSION=	0.4-2
PORTREVISION=	2
CATEGORIES=	www
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Translate CSS Selectors to XPath Expressions
WWW=		https://cran.r-project.org/web/packages/selectr/

LICENSE=	bsd3

CRAN_DEPENDS=	R-cran-stringr>0:textproc/R-cran-stringr \
		R-cran-R6>0:devel/R-cran-R6
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=	cran:auto-plist

.include <bsd.port.mk>
