PORTNAME=	desc
DISTVERSION=	1.4.3
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate DESCRIPTION Files
WWW=		https://github.com/r-lib/desc

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	R-cran-cli>0:devel/R-cran-cli \
		R-cran-R6>0:devel/R-cran-R6 \
		R-cran-rprojroot>0:devel/R-cran-rprojroot

USES=		cran:auto-plist

NO_TEST=	yes

.include <bsd.port.mk>
