PORTNAME=	googletest
PORTVERSION=	1.14.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for writing C++ tests on a variety of platforms
WWW=		https://google.github.io/googletest/ \
		https://github.com/google/googletest

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing compiler:c++14-lang python:test

CMAKE_OFF=	gmock_build_tests gtest_build_samples gtest_build_tests gtest_disable_pthreads gtest_hide_internal_symbols
CMAKE_ON=	BUILD_GMOCK BUILD_SHARED_LIBS INSTALL_GTEST
CMAKE_TESTING_ON=	gmock_build_tests gtest_build_tests
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION=${PORTVERSION}

USE_GITHUB=	yes
GH_ACCOUNT=	google

NO_TEST=	yes

.include <bsd.port.mk>
