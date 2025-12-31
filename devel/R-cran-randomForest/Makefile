PORTNAME=	randomForest
DISTVERSION=	4.7-1.2
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Classification based on a forest of trees using random inputs
WWW=		https://cran.r-project.org/web/packages/randomForest/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

BROKEN_i386=	fails to build

RUN_DEPENDS=	R-cran-RColorBrewer>=1.1_3:graphics/R-cran-RColorBrewer

USES=	cran:auto-plist,compiles

.include <bsd.port.mk>
