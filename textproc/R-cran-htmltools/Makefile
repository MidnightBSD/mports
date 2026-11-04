PORTNAME=	htmltools
DISTVERSION=	0.5.8.1
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for HTML generation and output
WWW=		https://cran.r-project.org/web/packages/htmltools/

LICENSE=	gpl2+

CRAN_DEPENDS=	R-cran-base64enc>0:converters/R-cran-base64enc \
		R-cran-digest>0:security/R-cran-digest \
		R-cran-ellipsis>0:devel/R-cran-ellipsis \
		R-cran-fastmap>=1.1.0:databases/R-cran-fastmap \
		R-cran-rlang>=0.4.10:devel/R-cran-rlang
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist,compiles

NO_TEST=	yes

.include <bsd.port.mk>
