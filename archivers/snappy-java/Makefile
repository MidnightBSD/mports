# Created by: Radim Kolar <hsn@filez.com>

PORTNAME=	snappy
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.10.5
PORTREVISION=	1
CATEGORIES=	archivers java
MASTER_SITES=	FREEBSD_LOCAL/otis:repo
PKGNAMESUFFIX=	java
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PORTNAME}-${PKGNAMESUFFIX}-repository-${PORTVERSION}${EXTRACT_SUFX}:repo
EXTRACT_ONLY=	${DISTFILE_DEFAULT} \
		${PORTNAME}-${PKGNAMESUFFIX}-repository-${PORTVERSION}${EXTRACT_SUFX} \
		${DISTFILE_google_benchmark} \
		${DISTFILE_google_googletest}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library
WWW=		https://github.com/xerial/snappy-java

LICENSE=	Apache-2.0

BUILD_DEPENDS=	cmake:devel/cmake-core \
		sbt:devel/sbt

USES=		gmake java:build

USE_GITHUB=	yes
GH_ACCOUNT=	xerial
GH_PROJECT=	snappy-java
GH_TAGNAME=	${DISTVERSIONFULL}
GH_TUPLE=	google:snappy:${DISTVERSION:R}:google \
		google:benchmark:d572f47:google_benchmark/google_benchmark \
		google:googletest:b796f7d:google_googletest/google_googletest \
		kiyo-masui:bitshuffle:${BITSHUFFLE_V}:masui

USE_LDCONFIG=	yes
MAKE_ARGS+=	CXX="${CXX}"
TEST_TARGET=	test
BITSHUFFLE_V=	0.3.4

PLIST_FILES=	${JAVAJARDIR}/snappy-java.jar \
		lib/libsnappyjava.so

NO_TEST=	yes

.include <bsd.port.pre.mk>

post-extract:
	${MKDIR} ${WRKSRC}/target
	${RM} ${WRKSRC}/sbt
	${CP} ${DISTDIR}/${DISTFILE_google} ${WRKSRC}/target/snappy-${PORTVERSION:R}${EXTRACT_SUFX}
	${CP} ${DISTDIR}/${DISTFILE_masui} ${WRKSRC}/target/bitshuffle-${BITSHUFFLE_V}${EXTRACT_SUFX}
	(cd ${WRKSRC}/google_benchmark && \
		${COPYTREE_SHARE} . ${WRKSRC}/target/snappy-${PORTVERSION:R}/third_party/benchmark)
	(cd ${WRKSRC}/google_googletest && \
		${COPYTREE_SHARE} . ${WRKSRC}/target/snappy-${PORTVERSION:R}/third_party/googletest)

do-build:
	cd ${WRKSRC} && ${SETENV} JAVA_HOME=${JAVA_HOME} ${MAKE_ENV} \
		${MAKE_CMD} ${MAKE_ARGS} SBT_IVY_HOME=${WRKDIR}/repository SBT_BOOT_DIR=${WRKDIR}/sbt_boot SBT_GLOBAL_DIR=${WRKDIR}/sbt_global

do-test-manual:
	cd ${WRKSRC} && ${SETENV} JAVA_HOME=${JAVA_HOME} ${MAKE_ENV} \
		${MAKE_CMD} ${MAKE_ARGS} SBT_IVY_HOME=${WRKDIR}/repository SBT_BOOT_DIR=${WRKDIR}/sbt_boot SBT_GLOBAL_DIR=${WRKDIR}/sbt_global test

.	if ${ARCH} == amd64
PLATFORM_DIR_SUFFIX=	MidnightBSD-x86_64
.	elif ${ARCH} == i386
PLATFORM_DIR_SUFFIX=	MidnightBSD-x86
.	else
PLATFORM_DIR_SUFFIX=	Default
.	endif

do-install:
	${INSTALL_DATA} ${WRKSRC}/target/snappy-java-*.jar \
		${STAGEDIR}${JAVAJARDIR}/snappy-java.jar
	${INSTALL_LIB} ${WRKSRC}/target/snappy-${PORTVERSION:R}-${PLATFORM_DIR_SUFFIX}/libsnappyjava.so \
		${FAKE_DESTDIR}${LOCALBASE}/lib

.include <bsd.port.post.mk>
