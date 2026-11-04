PORTNAME=	foreach
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreach looping construct for R
WWW=		https://cran.r-project.org/web/packages/foreach/

LICENSE=	Apache-2.0

CRAN_DEPENDS=	R-cran-iterators>0:devel/R-cran-iterators
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=	cran:auto-plist

NO_TEST=	yes

.include <bsd.port.mk>
