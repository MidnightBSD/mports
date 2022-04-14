PORTNAME=	highway
DISTVERSION=	0.16.0
CATEGORIES=	devel

PATCH_SITES=	https://github.com/${GH_ACCOUNT}/${GH_PROJECT}/commit/
PATCHFILES+=	1ac50ad83d8c.patch:-p1 # https://github.com/google/highway/pull/561

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance-portable, length-agnostic SIMD with runtime dispatch

LICENSE=	apache2

TEST_DEPENDS=	googletest>0:devel/googletest

USES=		cmake:testing compiler:c++11-lib
USE_GITHUB=	yes
GH_ACCOUNT=	google
CMAKE_ON=	BUILD_SHARED_LIBS HWY_SYSTEM_GTEST
CMAKE_OFF+=	${CMAKE_TESTING_ON}

.include <bsd.port.mk>
