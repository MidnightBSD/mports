PORTNAME=	brotli
DISTVERSIONPREFIX=	v
DISTVERSION=	1.2.0
PORTEPOCH=	1
CATEGORIES=	archivers devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic-purpose lossless compression algorithm
WWW=		https://github.com/google/brotli

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing cpe pathfix pkgconfig
CPE_VENDOR=	google
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	google

PLIST_SUB=	SHLIBVER=${DISTVERSION:R}

CMAKE_OFF=	BUILD_TESTING
CMAKE_ARGS=	-DSHARE_INSTALL_PREFIX=share

OPTIONS_DEFINE=		STATIC
OPTIONS_SUB=		yes

STATIC_CMAKE_BOOL=	BROTLI_BUILD_FOR_PACKAGE

.include <bsd.port.mk>
