PORTNAME=	rematch2
DISTVERSION=	2.1.2
PORTREVISION=	1
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tidy Output from Regular Expression Matching
WWW=		https://github.com/r-lib/rematch2 #readme

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	R-cran-tibble>0:devel/R-cran-tibble

USES=		cran:auto-plist

# circular dep
NO_TEST=	yes

.include <bsd.port.mk>
