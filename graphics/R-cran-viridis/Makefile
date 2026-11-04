PORTNAME=	viridis
PORTVERSION=	0.6.5
CATEGORIES=	graphics
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Default Color Maps from 'matplotlib'
WWW=		https://cran.r-project.org/web/packages/viridis/

LICENSE=	mit

RUN_DEPENDS=	R-cran-ggplot2>=1.0.1:graphics/R-cran-ggplot2 \
		R-cran-gridExtra>0:graphics/R-cran-gridExtra \
		R-cran-viridisLite>=0.4.0:graphics/R-cran-viridisLite

USES=		cran:auto-plist

.include <bsd.port.mk>
