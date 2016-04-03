# $MidnightBSD$
# $FreeBSD: head/lang/go14/Makefile 402537 2015-11-28 14:47:00Z mmoll $

PORTNAME=	go14
PORTVERSION=	1.4.3
CATEGORIES=	lang
MASTER_SITES=	http://golang.org/dl/
DISTNAME=	go${PORTVERSION}.src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Go programming language

LICENSE=	bsd3

USES=		compiler 
#shebangfix
SHEBANG_LANG=	sh
SHEBANG_FILES=	${WRKSRC}/src/*.bash \
		${WRKSRC}/doc/progs/run \
		${WRKSRC}/doc/articles/wiki/*.bash \
		${WRKSRC}/test/bench/shootout/timing.sh

sh_OLD_CMD=	"/usr/bin/env bash"
sh_CMD=		${SH}

WRKSRC=		${WRKDIR}/go

.include <bsd.port.pre.mk>

# If cc is clang, change it to clang to help Go identify the compiler
.if ${COMPILER_TYPE} == "clang" && ${CC} == "cc"
CC=clang
.endif

.if ${ARCH} == "i386"
GOARCH=386
GOOBJ=8
.elif ${ARCH} == "amd64"
GOARCH=amd64
GOOBJ=6
.else
IGNORE=		unknown arch ${ARCH}
.endif

PLIST_SUB+=	ARCH=${GOARCH} \
		GOOBJ=${GOOBJ}

post-patch:
	@cd ${WRKSRC} && ${FIND} . -name '*.orig' -delete

do-build:
	cd ${WRKSRC}/src && \
		CC=${CC} \
		GOROOT=${WRKSRC} GOROOT_FINAL=${PREFIX}/go14 \
		GOBIN= GOARCH=${GOARCH} GOOS=freebsd \
		CGO_ENABLED=0 \
		${SH} make.bash

do-install:
	@${CP} -a ${WRKSRC} ${STAGEDIR}${PREFIX}/go14

regression-test: build
	cd ${WRKSRC}/src && GOROOT=${WRKSRC} PATH=${WRKSRC}/bin:${PATH} ${SH} run.bash --no-rebuild --banner

.include <bsd.port.post.mk>
