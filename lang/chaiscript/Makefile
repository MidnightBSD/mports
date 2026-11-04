PORTNAME=	ChaiScript
DISTVERSIONPREFIX=	v
DISTVERSION=	6.1.0
PORTREVISION=	3
CATEGORIES=	lang

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embedded scripting language designed for C++
WWW=		https://chaiscript.com/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake localbase:ldflags readline
USE_GITHUB=	yes
USE_LDCONFIG=	${PREFIX}/lib/chaiscript

OPTIONS_DEFINE=		DYNLOAD MULTITHREAD STD_MAKE_SHARED CPP17
OPTIONS_DEFAULT=	DYNLOAD MULTITHREAD

DYNLOAD_DESC=		Dynamic Loading Support Enabled
DYNLOAD_CMAKE_BOOL=	DYNLOAD_ENABLED

MULTITHREAD_DESC=	Multithreaded Support Enabled
MULTITHREAD_CMAKE_BOOL=	MULTITHREAD_SUPPORT_ENABLED

STD_MAKE_SHARED_DESC=	Use std::make_shared instead of chaiscript::make_shared
STD_MAKE_SHARED_CMAKE_BOOL=	USE_STD_MAKE_SHARED

CPP17_DESC=		Build with C++17 flags
CPP17_CMAKE_BOOL=	BUILD_IN_CPP17_MODE
CPP17_USES=		compiler:c++17-lang
CPP17_USES_OFF=		compiler:c++14-lang

# magus
NO_TEST=	yes

do-test-special: # some tests are known to fail: https://github.com/ChaiScript/ChaiScript/issues/466
	@cd ${BUILD_WRKSRC} && \
		${SETENV} ${CONFIGURE_ENV} ${CMAKE_BIN} ${CMAKE_ARGS} -DRUN_FUZZY_TESTS:BOOL=ON ${CMAKE_SOURCE_PATH} && \
		${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} ${ALL_TARGET} && \
		${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} test

.include <bsd.port.mk>
