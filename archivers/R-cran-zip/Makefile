PORTNAME=	zip
DISTVERSION=	3.0.2
CATEGORIES=	archivers
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-Platform 'zip' Compression
WWW=		https://github.com/r-lib/zip #readme

LICENSE=	mit Apache-2.0
LICENSE_COMB=	multi

BUILD_RUN_DEPENDS=	R-cran-cli>=0:devel/R-cran-cli

USES=		cran:auto-plist,compiles

# dependency circular ref
NO_TEST=	yes

.include <bsd.port.mk>
