PORTNAME=	zstd
PORTVERSION=	1.5.6
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/facebook/zstd/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast real-time compression algorithm
WWW=		https://facebook.github.io/zstd/ \
		https://github.com/facebook/zstd

LICENSE=	bsd3 gpl2
LICENSE_COMB=	dual

TEST_DEPENDS=	gmd5sum:sysutils/coreutils

USES=		meson pkgconfig python:build shebangfix

MESON_ARGS=	-Ddefault_library=both
USE_LDCONFIG=	yes
WRKSRC_SUBDIR=	build/meson

SHEBANG_FILES=	*.py

PLIST_SUB=	BUILD_TYPE=${BUILD_TYPE:tl} PORTVERSION=${PORTVERSION}
SUB_FILES=	zstdConfigVersion.cmake zstdTargets-BUILD_TYPE.cmake
SUB_LIST=	BUILD_TYPE_CAPS=${BUILD_TYPE:tu} BUILD_TYPE_MIXED=${BUILD_TYPE} PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	LZ4 OPTIMIZED_CFLAGS TEST
OPTIONS_DEFAULT=LZ4

LZ4_LIB_DEPENDS=	liblz4.so:archivers/liblz4
LZ4_MESON_ENABLED=	lz4
LZ4_USES=		localbase:ldflags
OPTIMIZED_CFLAGS_VARS=	CFLAGS+=-O3
TEST_MESON_TRUE=	bin_tests

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/cmake/zstd
	${INSTALL_DATA} ${FILESDIR}/zstdConfig.cmake ${STAGEDIR}${PREFIX}/lib/cmake/zstd/zstdConfig.cmake
	${INSTALL_DATA} ${WRKDIR}/zstdConfigVersion.cmake ${STAGEDIR}${PREFIX}/lib/cmake/zstd/zstdConfigVersion.cmake
	${INSTALL_DATA} ${WRKDIR}/zstdTargets-BUILD_TYPE.cmake ${STAGEDIR}${PREFIX}/lib/cmake/zstd/zstdTargets-${BUILD_TYPE:tl}.cmake
	${INSTALL_DATA} ${FILESDIR}/zstdTargets.cmake ${STAGEDIR}${PREFIX}/lib/cmake/zstd/zstdTargets.cmake
	${LN} -s zstd.1.gz ${STAGEDIR}${PREFIX}/share/man/man1/zstdmt.1.gz

.include <bsd.port.mk>
