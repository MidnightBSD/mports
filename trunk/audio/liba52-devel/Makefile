# New ports collection makefile for:	liba52-devel
# Date created:				Mon Oct 17 02:22:44 UTC 2005
# Whom:                 Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $MidnightBSD: mports/audio/liba52-devel/Makefile,v 1.1 2006/11/02 20:52:57 wintellect Exp $
# $FreeBSD: ports/audio/liba52-devel/Makefile,v 1.20 2006/06/24 05:37:54 linimon Exp $
#

PORTNAME=	liba52
PORTVERSION=	0.7.4.${DISTFILE_DATE}
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	lioux
PKGNAMESUFFIX=	-devel
DISTNAME=	FFMpeg-${DISTFILE_DATE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free library for decoding ATSC A/52 streams, aka AC-3

OPTIONS=	DJBFFT "Adds support for fast djbfft fft library" ON \
		OPTIMIZED_CFLAGS "Enable extra performance optimizations" OFF

USE_BZIP2=	yes
MAKE_ARGS=	LIB_VERSION="${LIB_VERSION}" PREFIX="${PREFIX}"
USE_LDCONFIG=	yes

# We want DESTDIR=$FAKE_DESTDIR$PREFIX/ when it is all said and done.
DESTDIRNAME=	NOTUSED
FAKE_MAKEARGS+=	DESTDIR=${FAKE_DESTDIR}${PREFIX}/ ${MAKE_ARGS}

WRKSRC=		${WRKDIR}/${DISTNAME}/libavcodec/liba52

LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}
PLIST_SUB=	LIB_VERSION="${LIB_VERSION}"

DISTFILE_DATE=	2005112800
LIB_VERSION=	0

post-extract:
	@${CP} ${FILESDIR}/${MAKEFILE} ${BUILD_WRKSRC}

post-configure:
	@${SED} -E \
		-e 's|/usr/local/|${PREFIX}/|' \
		-e 's|%%LIB_VERSION%%|${LIB_VERSION}|' \
		-e 's|%%DJBFFT%%|${DJBFFT_LIBRARY}|' \
		-e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		-e 's|%%PREFIX%%|${PREFIX}|' \
		${FILESDIR}/liba52-devel.la > \
		${WRKDIR}/liba52-devel.la

pre-install:
	@${MKDIR} ${PREFIX}/include/a52dec-devel

post-install:
	@${INSTALL_DATA} ${WRKDIR}/liba52-devel.la \
		${PREFIX}/lib

.include <bsd.port.pre.mk>

###
## specific ARCH information
###
.if ${ARCH} == "ia64"
BROKEN=	does not build on ia64
.endif
.if ${ARCH} == "i386" || ${ARCH} == "ia64"
CFLAGS+=	-DARCH_X86
. if ${ARCH} == "ia64" || ${ARCH} == "amd64"
CFLAGS+=	-DARCH_X86_64
. endif
.endif
## sse hardware vector support
.if (defined(MACHINE_CPU) && ${MACHINE_CPU:Msse} == "sse")
CFLAGS+=	-DHAVE_SSE
.endif

###
## library dependency
###
.if !defined(WITHOUT_DJBFFT) && !defined(PACKAGE_BUILDING)
BUILD_DEPENDS+=	${LOCALBASE}/lib/libdjbfft.a:${PORTSDIR}/math/djbfft
RUN_DEPENDS+=	${LOCALBASE}/lib/libdjbfft.a:${PORTSDIR}/math/djbfft

CFLAGS+=	-DLIBA52_DJBFFT -I${LOCALBASE}/include

DJBFFT_LIBRARY=	-ldjbfft
.endif

###
## optimizations
###
.ifdef(WITH_OPTIMIZED_CFLAGS)
CFLAGS+=	-O3 -ffast-math
.endif

.include <bsd.port.post.mk>
