PORTNAME=	cxxopts
DISTVERSIONPREFIX=	v
DISTVERSION=	3.2.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C++ command line option parser
WWW=		https://github.com/jarro2783/cxxopts

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing compiler:c++11-lang
USE_GITHUB=	yes
GH_ACCOUNT=	jarro2783

CMAKE_OFF=	CXXOPTS_BUILD_TESTS CXXOPTS_BUILD_EXAMPLES
CMAKE_TESTING_ON=	CXXOPTS_BUILD_TESTS

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	include/cxxopts.hpp \
		lib/cmake/cxxopts/cxxopts-config-version.cmake \
		lib/cmake/cxxopts/cxxopts-config.cmake \
		lib/cmake/cxxopts/cxxopts-targets.cmake \
		libdata/pkgconfig/cxxopts.pc

.include <bsd.port.mk>
