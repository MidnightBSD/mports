PORTNAME=	zxing-cpp
DISTVERSIONPREFIX=	v
DISTVERSION=	2.2.1
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library for linear/matrix barcode recognition
WWW=		https://github.com/zxing-cpp/zxing-cpp

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c++17-lang iconv
USE_GITHUB=	yes
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
# Disable
# * examples (no installation target)
# * blackbox test (fetches third party source)
CMAKE_OFF=	BUILD_EXAMPLES \
		BUILD_BLACKBOX_TESTS

.include <bsd.port.mk>
