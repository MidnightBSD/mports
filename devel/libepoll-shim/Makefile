# Created by: Johannes Lundberg <johalun0@gmail.com>

PORTNAME=	libepoll-shim
PORTVERSION=	0.0.20200602
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small epoll implementation using kqueue

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c11,c++17-lang
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	jiixyj
GH_PROJECT=	epoll-shim
GH_TAGNAME=	3840e9c

CC=	clang70
MAKE_ENV+=	CC=clang70
LLVM_DEFAULT=   70                                                                                                                                                        
BUILD_DEPENDS+= llvm${LLVM_DEFAULT}>=3.9.0_4:devel/llvm${LLVM_DEFAULT}                                                                                                    
RUN_DEPENDS+=   llvm${LLVM_DEFAULT}>=3.9.0_4:devel/llvm${LLVM_DEFAULT}                                                                                                    
CONFIGURE_ENV+= LLVM_CONFIG=${LOCALBASE}/bin/llvm-config${LLVM_DEFAULT}                                                                                                   
LDFLAGS+=       -Wl,-rpath=${LOCALBASE}/llvm${LLVM_DEFAULT}/lib   

do-test:
	# Exclude certain tests in resource restricted environments
	@(if [ `ulimit -n` -lt 20100 ]; then \
	    ${ECHO} "Skipping test perf-many-fds.perf_many_fds__perf"; \
	    SKIP_TESTS="-E ^(perf-many-fds.perf_many_fds__perf"; \
	    if [ `ulimit -n` -lt 1100 ]; then \
	        ${ECHO} "Skipping test timerfd-test.timerfd__many_timers"; \
	        SKIP_TESTS=$$SKIP_TESTS"|timerfd-test.timerfd__many_timers"; \
	    fi; \
	    SKIP_TESTS=$$SKIP_TESTS")$$"; \
	fi; \
	cd ${TEST_WRKSRC} && \
	${SETENV} ${TEST_ENV} ctest -C ${CMAKE_BUILD_TYPE} $$SKIP_TESTS)

.include <bsd.port.mk>
