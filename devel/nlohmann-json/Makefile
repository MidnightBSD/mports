PORTNAME=	json
DISTVERSIONPREFIX=	v
DISTVERSION=	3.11.3
CATEGORIES=	devel
PKGNAMEPREFIX=	nlohmann-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON library for Modern C++
WWW=		https://nlohmann.github.io/json

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.MIT

USES=		cmake compiler:c++11-lib
USE_GITHUB=	yes
GH_ACCOUNT=	nlohmann

NO_BUILD=	yes
NO_ARCH=	yes
#magus issues
NO_TEST=	yes

CMAKE_ON=	JSON_MultipleHeaders
CMAKE_OFF=	JSON_BuildTests

#do-test: # 2 tests are expected to fail, see https://github.com/nlohmann/json/issues/2951
#	@cd ${BUILD_WRKSRC} && \
#		${SETENV} ${CONFIGURE_ENV} ${CMAKE_BIN} ${CMAKE_ARGS} -DJSON_BuildTests:BOOL=ON ${CMAKE_SOURCE_PATH} && \
#		${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} ${ALL_TARGET} && \
#		${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} test

.include <bsd.port.mk>
