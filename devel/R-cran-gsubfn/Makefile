PORTNAME=	gsubfn
DISTVERSION=	0.7
PORTREVISION=	1
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	R package used for string matching, substitution and parsing
WWW=		https://code.google.com/p/gsubfn/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

CRAN_DEPENDS=	R-cran-proto>=0.3.9.2_6:devel/R-cran-proto
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=	cran:auto-plist

.include <bsd.port.mk>
