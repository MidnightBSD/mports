PORTNAME=	range-v3
DISTVERSION=	0.12.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Experimental range library for C++11/14/17
WWW=		https://github.com/ericniebler/range-v3

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake compiler:c++11-lang

USE_GITHUB=	yes
GH_ACCOUNT=	ericniebler

CMAKE_OFF=	RANGE_V3_TESTS RANGE_V3_EXAMPLES

NO_ARCH=	yes
NO_TEST=	yes

post-install:
	@${RM} ${PREFIX}/include/module.modulemap

build-examples: build
	@cd ${BUILD_WRKSRC} && \
		${SETENV} ${CONFIGURE_ENV} ${CMAKE_BIN} ${CMAKE_ARGS} -DRANGE_V3_EXAMPLES:BOOL=ON ${CMAKE_SOURCE_PATH} && \
		${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} ${ALL_TARGET}

.include <bsd.port.mk>
