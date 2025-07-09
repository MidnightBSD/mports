PORTNAME=	jquerylib
PORTVERSION=	0.1.4
PORTREVISION=	1
CATEGORIES=	www
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Obtain 'jQuery' as an HTML Dependency Object
WWW=		https://cran.r-project.org/web/packages/jquerylib/

LICENSE=	mit

CRAN_DEPENDS=	R-cran-htmltools>0:textproc/R-cran-htmltools
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist

.include <bsd.port.mk>
