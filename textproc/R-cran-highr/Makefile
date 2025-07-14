PORTNAME=	highr
PORTVERSION=	0.11
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Syntax Highlighting for R Source Code
WWW=		https://cran.r-project.org/web/packages/highr/

LICENSE=	gpl2+

CRAN_DEPENDS=	R-cran-xfun>=0.18:misc/R-cran-xfun
BUILD_DEPENDS=	${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist

.include <bsd.port.mk>
