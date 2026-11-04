PORTNAME=	pkgbuild
DISTVERSION=	1.4.8
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find Tools Needed to Build R Packages
WWW=		https://github.com/r-lib/pkgbuild

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	R-cran-callr>=3.2.0:devel/R-cran-callr \
		R-cran-cli>=3.4.0:devel/R-cran-cli \
		R-cran-desc>0:devel/R-cran-desc \
		R-cran-processx>0:sysutils/R-cran-processx \
		R-cran-R6>0:devel/R-cran-R6

USES=		cran:auto-plist

# circular
NO_TEST=	yes

.include <bsd.port.mk>
