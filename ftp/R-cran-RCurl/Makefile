PORTNAME=	RCurl
DISTVERSION=	1.98-1.17
CATEGORIES=	ftp
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General network client interface for R
WWW=		https://cran.r-project.org/web/packages/RCurl/

LICENSE=	bsd3

BUILD_DEPENDS=	curl-config:ftp/curl \
		R-cran-bitops>0:devel/R-cran-bitops
LIB_DEPENDS=	libcurl.so:ftp/curl
RUN_DEPENDS=	R-cran-bitops>0:devel/R-cran-bitops

USES=		cran:auto-plist,compiles gnome
USE_GNOME=	libxml2

.include <bsd.port.mk>
