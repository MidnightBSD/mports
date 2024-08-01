PORTNAME=	jpeg-turbo
DISTVERSION=	3.0.3
PORTREVISION?=	0
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/lib${PORTNAME}/lib${PORTNAME}/releases/download/${DISTVERSION}/
DISTNAME=	lib${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	SIMD-accelerated JPEG codec which replaces libjpeg
WWW?=		https://libjpeg-turbo.org/

LICENSE=	bsd3 IJG zlib
LICENSE_COMB=	multi
LICENSE_GROUPS_IJG=	FSF GPL
LICENSE_NAME_IJG=	Independent JPEG Group License
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.md
LICENSE_FILE_IJG=	${WRKSRC}/README.ijg
LICENSE_FILE_zlib=	${WRKSRC}/LICENSE.md
LICENSE_PERMS_IJG=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cmake cpe pathfix
USE_LDCONFIG=	yes

CPE_PRODUCT=	libjpeg-turbo
TEST_TARGET=	test

PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/libjpeg-turbo

CMAKE_ON=	WITH_JPEG8
# See https://github.com/libjpeg-turbo/libjpeg-turbo/issues/705
CMAKE_ARGS=	-DCMAKE_CTEST_ARGUMENTS="-E;'djpeg12-shared-3x2-float-prog-cmp|djpeg12-static-3x2-float-prog-cmp'"

OPTIONS_DEFINE=		DOCS OPTIMIZED_CFLAGS
OPTIONS_DEFAULT=	OPTIMIZED_CFLAGS

OPTIMIZED_CFLAGS_CFLAGS=	-O3

.include <bsd.mport.options.mk>

.if ${ARCH} == i386 || ${ARCH} == amd64
BUILD_DEPENDS+=	nasm:devel/nasm
.endif

.if ${ARCH} == armv6
CMAKE_OFF=	WITH_SIMD
.endif

.if ${SLAVE_PORT} == yes
PLIST_SUB+=	JPEG="@comment " LIBTURBOJPEG=""
.else
CMAKE_OFF+=	WITH_TURBOJPEG
CONFLICTS_INSTALL=	mozjpeg jpeg-[0-9]*
PLIST_SUB+=	JPEG="" LIBTURBOJPEG="@comment "
.endif

.include <bsd.port.mk>
