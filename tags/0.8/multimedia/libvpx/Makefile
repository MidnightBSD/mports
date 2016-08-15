# $MidnightBSD$

PORTNAME=	libvpx
PORTVERSION=	1.3.0
CATEGORIES=	multimedia
MASTER_SITES=	DEBIAN
DISTNAME=	${PORTNAME}_${DISTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VP8/VP9 Codec SDK

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash \
		yasm:${PORTSDIR}/devel/yasm

USES=		gmake perl5 tar:bzip2
HAS_CONFIGURE=	yes
USE_PERL5=	build
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DEBUG POSTPROC RUNTIME THREADS SHARED
OPTIONS_DEFAULT=	POSTPROC RUNTIME THREADS SHARED
OPTIONS_EXCLUDE_armv6=	RUNTIME
POSTPROC_DESC=	Enable postprocessing
RUNTIME_DESC=	Enable runtime CPU detection
SHARED_DESC=	Enable shared-library support

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}
ALL_TARGET=
CONFIGURE_ARGS+=--prefix=${PREFIX} \
		--disable-install-docs \
		--disable-install-srcs \
		--enable-pic \
		--enable-vp8 \
		--enable-vp9
MAKE_ARGS+=	verbose=yes
MAKE_ENV=	LC_ALL=C

OPTIONS_SUB=		SHARED

DEBUG_CONFIGURE_ON=	--enable-debug
POSTPROC_CONFIGURE_ON=	--enable-postproc
RUNTIME_CONFIGURE_ON=	--enable-runtime-cpu-detect
THREADS_CONFIGURE_OFF=	--disable-multithread
SHARED_CONFIGURE_ON=	--enable-shared

.include <bsd.mport.options.mk>

.if ${OSVERSION}  < 4015
.if ${ARCH} == "amd64"
USE_GCC=	yes
.endif
.endif

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=	--target=x86_64-linux-gcc
.elif ${ARCH} == "i386"
CONFIGURE_ARGS+=	--target=x86-linux-gcc
.endif

post-patch:
	@${REINPLACE_CMD} 's|\(link_with_cc\)=gcc|\1=$${CC}|' \
		${WRKSRC}/build/make/configure.sh
	@${REINPLACE_CMD} -e 's|%%DESTDIR%%|${STAGEDIR}|g' \
	       	${WRKSRC}/build/make/Makefile ${WRKSRC}/libs.mk
	@${GREP} -Rl '^#!/bin/bash' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} \
		-e 's,#!/bin/bash,#!/usr/bin/env bash,g'
	@${GREP} -Rl -- '-l\?pthread' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} -E \
		-e 's/-l?pthread/${PTHREAD_LIBS}/g'

.include <bsd.port.mk>
