PORTNAME=	onnx
DISTVERSIONPREFIX=	v
DISTVERSION=	1.17.0
PORTREVISION=	3
CATEGORIES=	misc # machine-learning

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Neural Network eXchange
WWW=		https://onnx.ai \
		https://github.com/onnx/onnx

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

#BUILD_DEPENDS=	bash:shells/bash
LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libprotobuf.so:devel/protobuf

USES=		cmake:testing compiler:c++17-lang python:build

USE_GITHUB=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_ONNX_PYTHON
CMAKE_TESTING_ON=	ONNX_BUILD_TESTS
CMAKE_TESTING_TARGET=

CXXFLAGS+=	-Dstat64=stat

NO_TEST=	yes

post-install:
	@${FIND} ${STAGEDIR}${PREFIX}/include -type d -empty -delete

#post-test:
#	cd ${BUILD_WRKSRC} && ./onnx_gtests

# tests as of 1.17.0: 84 tests from 11 test suites ran. (160 ms total)

.include <bsd.port.mk>
