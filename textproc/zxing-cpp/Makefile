PORTNAME=	zxing-cpp
DISTVERSIONPREFIX=	v
DISTVERSION=	2.3.0
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library for linear/matrix barcode recognition
WWW=		https://github.com/zxing-cpp/zxing-cpp

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c++20-lang iconv pathfix
USE_GITHUB=	yes
USE_LDCONFIG=	yes

NO_TEST=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
# Disable
# * examples (no installation target)
# * blackbox test (fetches third party source)
CMAKE_OFF=	BUILD_EXAMPLES \
		BUILD_BLACKBOX_TESTS \
		ZXING_UNIT_TESTS

PLIST_SUB=	SOVERSION=${DISTVERSION}

.include <bsd.port.mk>
