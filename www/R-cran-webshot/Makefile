PORTNAME=	webshot
DISTVERSION=	0.5.5
CATEGORIES=	www
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Take Screenshots of Web Pages
WWW=		https://wch.github.io/webshot/

LICENSE=	gpl2

RUN_DEPENDS=	R-cran-jsonlite>0:converters/R-cran-jsonlite \
		R-cran-callr>0:devel/R-cran-callr \
		R-cran-magrittr>0:devel/R-cran-magrittr

USES=		cran:auto-plist

.include <bsd.port.mk>
