PORTNAME=	curl
DISTVERSION=	6.2.3
CATEGORIES=	ftp
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern and Flexible Web Client for R
WWW=		https://cran.r-project.org/package=curl

LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/include/curl/curl.h:ftp/curl
LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		cran:auto-plist,compiles

# circular dependency issues with testing
NO_TEST=	yes

.include <bsd.port.mk>
