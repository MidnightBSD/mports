PORTNAME=	png
DISTVERSION=	1.6.59
CATEGORIES=	graphics
MASTER_SITES=	SF/lib${PORTNAME}/lib${PORTNAME}16/${DISTVERSION}/
DISTNAME=	lib${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating PNG images
WWW=		http://www.libpng.org/pub/png/libpng.html

LICENSE=	Libpng
LICENSE_GROUPS=	FSF GPL OSI
LICENSE_NAME=	libpng License
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cmake:testing cpe pathfix tar:xz
CPE_PRODUCT=	libpng
USE_LDCONFIG=	yes
HAS_SYMBOL_VERSION=	${PREFIX}/lib/libpng16.so

CMAKE_TESTING_ON=	PNG_TESTS

CMAKE_ARGS=	-DPNG_DEBUG_POSTFIX=""
CMAKE_OFF=	PNG_TESTS

OPTIONS_DEFINE=	APNG SIMD
OPTIONS_DEFAULT=APNG
OPTIONS_DEFAULT_aarch64=	SIMD
OPTIONS_DEFAULT_amd64=	SIMD
OPTIONS_DEFAULT_powerpc64le=	SIMD
# arm/arm_init.c:43:6: error: "No support for run-time ARM Neon checking; use compile-time options"
.ifdef QEMU_EMULATING
OPTIONS_EXCLUDE_armv6=	SIMD
OPTIONS_EXCLUDE_armv7=	SIMD
.endif

APNG_DESC=Enable Animated PNG support

SIMD_CMAKE_BOOL=	PNG_HARDWARE_OPTIMIZATIONS

.include <bsd.mport.options.mk>

.if ${ARCH} == powerpc64 && ${PORT_OPTIONS:MSIMD}
USES+=		compiler:c11
CFLAGS+=	-maltivec -mvsx
.endif

.if ${PORT_OPTIONS:MAPNG} || make(makesum)
# No 1.6.59 APNG patch is available yet.
PATCH_SITES=	SF/lib${PORTNAME}-apng/lib${PORTNAME}16/1.6.58/
PATCHFILES=	lib${PORTNAME}-1.6.58-apng.patch.gz:-p1
.endif

.include <bsd.port.mk>
