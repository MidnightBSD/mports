PORTNAME=	flatbuffers
DISTVERSIONPREFIX=	v
DISTVERSION=	23.3.3
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Memory efficient serialization library
WWW=		https://google.github.io/flatbuffers/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing compiler:c++14-lang cpe python:build
CPE_VENDOR=	google
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	google

CMAKE_ON=	FLATBUFFERS_BUILD_SHAREDLIB
CMAKE_OFF=	FLATBUFFERS_BUILD_FLATLIB FLATBUFFERS_BUILD_TESTS
CMAKE_TESTING_ON=	FLATBUFFERS_BUILD_TESTS # one test fails, see https://github.com/google/flatbuffers/issues/7009 and https://github.com/google/flatbuffers/issues/7556

BINARY_ALIAS=	git=false python3=${PYTHON_CMD}

.include <bsd.port.mk>
