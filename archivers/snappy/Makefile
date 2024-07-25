PORTNAME=	snappy
DISTVERSION=	1.2.1
PORTREVISION=	1
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library
WWW=		https://google.github.io/snappy/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake compiler:c++11-lang cpe
CPE_VENDOR=	google
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	google

PLIST_SUB=	DISTVERSION=${DISTVERSION}
SUB_FILES=	snappy.pc
SUB_LIST=	DISTVERSION=${DISTVERSION}

CMAKE_OFF=	SNAPPY_BUILD_BENCHMARKS \
		SNAPPY_BUILD_TESTS
CMAKE_ON=	BUILD_SHARED_LIBS

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libsnappy.so.${PORTVERSION}
	${INSTALL_DATA} ${WRKDIR}/snappy.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
