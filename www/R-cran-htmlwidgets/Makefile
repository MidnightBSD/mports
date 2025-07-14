PORTNAME=	htmlwidgets
PORTVERSION=	1.6.4
CATEGORIES=	www
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML Widgets for R
WWW=		https://cran.r-project.org/web/packages/htmlwidgets/

LICENSE=	mit

RUN_DEPENDS=	R-cran-htmltools>=0.5.7:textproc/R-cran-htmltools \
		R-cran-jsonlite>=0.9.16:converters/R-cran-jsonlite \
		R-cran-yaml>0:textproc/R-cran-yaml \
		R-cran-knitr>=1.8:print/R-cran-knitr \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown

USES=		cran:auto-plist

.include <bsd.port.mk>
