PORTNAME=	zstd
PORTVERSION=	1.5.7
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/facebook/zstd/releases/download/v${PORTVERSION}/

# The 1.5.7 release omitted its updated manual pages.
PATCH_SITES=	https://github.com/facebook/zstd/commit/
PATCHFILES=	6af3842118ea5325480b403213b2a9fbed3d3d74.diff:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast real-time compression algorithm
WWW=		https://facebook.github.io/zstd/ \
		https://github.com/facebook/zstd

LICENSE=	bsd3 gpl2
LICENSE_COMB=	dual

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	liblz4.so:archivers/liblz4

USES=		gmake localbase:ldflags tar:zst cpe
CPE_VENDOR=	facebook

ALL_TARGET=	default
BINARY_ALIAS=	gmd5sum=md5sum
CFLAGS+=	-fPIC
MAKE_ENV=	INSTALL_DATA="${INSTALL_DATA}" \
		INSTALL_MAN="${INSTALL_MAN}" \
		MANDIR=${PREFIX}/share/man \
		PREFIX=${TRUE_PREFIX} \
		DESTDIR=${FAKE_DESTDIR} \
		V=1
#TEST_TARGET=	shortest
NO_TEST=	yes
USE_LDCONFIG=	yes

PLIST_SUB=	BUILD_TYPE=${BUILD_TYPE:tl} PORTVERSION=${PORTVERSION}
SUB_FILES=	zstdConfigVersion.cmake zstdTargets-BUILD_TYPE.cmake
SUB_LIST=	BUILD_TYPE_CAPS=${BUILD_TYPE:tu} BUILD_TYPE_MIXED=${BUILD_TYPE} PORTVERSION=${PORTVERSION}

BUILD_TYPE=	${defined(WITH_DEBUG) :?Debug:Release}

OPTIONS_DEFINE=	OPTIMIZED_CFLAGS

OPTIMIZED_CFLAGS_VARS=	CFLAGS+=-O3

post-install:
	${MKDIR} ${PREFIX}/lib/cmake/zstd
	${INSTALL_DATA} ${FILESDIR}/zstdConfig.cmake ${PREFIX}/lib/cmake/zstd/zstdConfig.cmake
	${INSTALL_DATA} ${WRKDIR}/zstdConfigVersion.cmake ${PREFIX}/lib/cmake/zstd/zstdConfigVersion.cmake
	${INSTALL_DATA} ${WRKDIR}/zstdTargets-BUILD_TYPE.cmake ${PREFIX}/lib/cmake/zstd/zstdTargets-${BUILD_TYPE:tl}.cmake
	${INSTALL_DATA} ${FILESDIR}/zstdTargets.cmake ${PREFIX}/lib/cmake/zstd/zstdTargets.cmake
	${LN} -s zstd.1.gz ${PREFIX}/share/man/man1/zstdmt.1.gz

.include <bsd.port.mk>
