PORTNAME=	c-blosc
PORTVERSION=	1.21.6
DISTVERSIONPREFIX=	v
CATEGORIES=	archivers devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Blocking, shuffling and loss-less compression library
WWW=		https://blosc.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake compiler:c11
USE_CSTD=	c11
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Blosc

TEST_TARGET=	test

PLIST_SUB=	VERSION="${PORTVERSION:R:R}" \
		SOVERSION="${PORTVERSION}"

CMAKE_ARGS=	-DBUILD_SHARED=ON

OPTIONS_DEFINE=	STATIC TEST AVX2 LZ4 SSE2 SNAPPY ZLIB ZSTD
OPTIONS_DEFAULT=STATIC LZ4 SSE2 SNAPPY ZLIB ZSTD
OPTIONS_SUB=	yes

AVX2_DESC=	Attempt to build with AVX2 instructions
SSE2_DESC=	Attempt to build with SSE2 instructions

AVX2_CMAKE_BOOL_OFF=	DEACTIVATE_AVX2
SSE2_CMAKE_BOOL_OFF=	DEACTIVATE_SSE2

LZ4_CMAKE_ON=		-DPREFER_EXTERNAL_LZ4=ON
LZ4_CMAKE_BOOL_OFF=	DEACTIVATE_LZ4
LZ4_LIB_DEPENDS=	liblz4.so:archivers/liblz4

SNAPPY_CMAKE_ON=	-DPREFER_EXTERNAL_SNAPPY=ON
SNAPPY_CMAKE_BOOL_OFF=	DEACTIVATE_SNAPPY
SNAPPY_LIB_DEPENDS=	libsnappy.so:archivers/snappy

STATIC_CMAKE_BOOL=	BUILD_STATIC

TEST_CMAKE_BOOL=	BUILD_TESTS BUILD_BENCHMARKS

ZLIB_CMAKE_ON=		-DPREFER_EXTERNAL_ZLIB=ON
ZLIB_CMAKE_BOOL_OFF=	DEACTIVATE_ZLIB

ZSTD_CMAKE_ON=		-DPREFER_EXTERNAL_ZSTD=ON
ZSTD_CMAKE_BOOL_OFF=	DEACTIVATE_ZSTD
ZSTD_LIB_DEPENDS=	libzstd.so:archivers/zstd

.include <bsd.port.mk>
