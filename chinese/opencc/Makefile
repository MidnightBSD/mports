PORTNAME=	opencc
DISTVERSION=	1.1.6
DISTVERSIONPREFIX=	ver.
CATEGORIES=	chinese converters

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Chinese Convert library and utilities
WWW=		https://github.com/BYVoid/OpenCC

LICENSE=	Apache-2.0

USE_GITHUB=	yes
GH_ACCOUNT=	BYVoid
GH_PROJECT=	OpenCC

USES=		cmake compiler:c++11-lib python:build
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	TESTS

TESTS_DESC=	Build the unit testing
TESTS_CMAKE_ON=	-DENABLE_GTEST=ON

MAKE_JOBS_UNSAFE=	yes
TEST_TARGET=	test

post-patch:
	@${REINPLACE_CMD} -e "s|python|${PYTHON_CMD}|g" \
		${WRKSRC}/data/CMakeLists.txt

.include <bsd.port.mk>
