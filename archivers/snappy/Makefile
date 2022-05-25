# Created by: Vanilla I. Shu <vanilla@FreeBSD.org>

PORTNAME=	snappy
PORTVERSION=	1.1.9
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library

LICENSE=	bsd3

USES=		cmake compiler:c++11-lang cpe
USE_LDCONFIG=	yes
CPE_VENDOR=	google
CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	SNAPPY_BUILD_TESTS SNAPPY_BUILD_BENCHMARKS
CMAKE_BUILD_TYPE=	Release
USE_GITHUB=	yes
GH_ACCOUNT=	google
PLIST_SUB+=	PORTVERSION=${PORTVERSION}
SUB_FILES+=	snappy.pc
SUB_LIST+=	PORTVERSION=${PORTVERSION}

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libsnappy.so.${PORTVERSION}
	${INSTALL_DATA} ${WRKDIR}/snappy.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
