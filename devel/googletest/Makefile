PORTNAME=	googletest
DISTVERSIONPREFIX=	release-
DISTVERSION=	1.12.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for writing C++ tests on a variety of platforms
WWW=		https://github.com/google/googletest

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	google

USES=		cmake:testing compiler:c++11-lib python:test
USE_LDCONFIG=	yes
CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_TESTING_ON=	gtest_build_tests gmock_build_tests

# 97% pass on magus... :(
NO_TEST=	yes

.include <bsd.port.mk>
