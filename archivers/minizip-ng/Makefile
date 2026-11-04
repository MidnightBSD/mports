PORTNAME=	minizip-ng
DISTVERSION=	4.2.2
CATEGORIES=	archivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fork of the popular minizip found in the zlib distribution
WWW=		https://github.com/zlib-ng/minizip-ng

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libz-ng.so:archivers/zlib-ng \
		libzstd.so:archivers/zstd

USES=		cmake:testing iconv pathfix pkgconfig ssl
USES+=	cpe
CPE_VENDOR=	zlib-ng
USE_GITHUB=	yes
GH_ACCOUNT=	zlib-ng
GH_TUPLE=	ip7z:7zip:26.02:7zip/third_party/ppmd
USE_LDCONFIG=	yes

NO_TEST=	yes

CMAKE_ARGS=	-DCMAKE_INSTALL_INCLUDEDIR=${LOCALBASE}/include/ \
		-DMZ_LIB_SUFFIX=-ng \
		-DFETCHCONTENT_SOURCE_DIR_PPMD=${WRKSRC}/third_party/ppmd
CMAKE_ON=	BUILD_SHARED_LIBS CMAKE_DISABLE_FIND_PACKAGE_ZLIB CMAKE_POSITION_INDEPENDENT_CODE
CMAKE_TESTING_ON=	MZ_BUILD_TEST MZ_BUILD_UNIT_TEST

PLIST_SUB+=	VERSION="${DISTVERSION}"

post-install:
	${INSTALL_DATA} ${FILESDIR}/mz_compat.h \
		${PREFIX}/include/minizip-ng/

.include <bsd.port.mk>
