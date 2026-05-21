PORTNAME=	miscTools
DISTVERSION=	0.6-30
CATEGORIES=	math
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Miscellaneous small tools and utilities for R
WWW=		http://www.micecon.org/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

CRAN_DEPENDS=	R-cran-digest>=0:security/R-cran-digest
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist

.include <bsd.port.mk>
