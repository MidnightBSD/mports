PORTNAME=	highway
DISTVERSION=	1.2.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance-portable, length-agnostic SIMD with runtime dispatch
WWW=		https://github.com/google/highway

LICENSE=	Apache-2.0

TEST_DEPENDS=	googletest>0:devel/googletest

USES=		cmake:testing compiler:c++11-lib
USE_GITHUB=	yes
GH_ACCOUNT=	google
CMAKE_ON=	BUILD_SHARED_LIBS HWY_SYSTEM_GTEST
CMAKE_OFF+=	${CMAKE_TESTING_ON}

NO_TEST=	yes

.include <bsd.port.mk>
