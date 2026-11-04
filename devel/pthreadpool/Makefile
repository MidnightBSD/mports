PORTNAME=	pthreadpool
DISTVERSION=	0.1-126
DISTVERSIONSUFFIX=	-gb8374f8
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pthread-based thread pool for C/C++ for arrays parallelization
WWW=		https://github.com/Maratyszcza/pthreadpool

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/include/fxdiv.h:devel/fxdiv

USES=		cmake compiler:c11 localbase
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Maratyszcza

CMAKE_OFF=	PTHREADPOOL_BUILD_TESTS PTHREADPOOL_BUILD_BENCHMARKS
CMAKE_ON=	BUILD_SHARED_LIBS

NO_TEST=	yes

PLIST_FILES=	include/pthreadpool.h \
		lib/libpthreadpool.so

.include <bsd.port.mk>
