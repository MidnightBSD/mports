# Created by: Devon H. O'Dell <devon.odell@gmail.com>

PORTNAME=	go
PORTVERSION=	1.13.5
PORTEPOCH=	1
CATEGORIES=	lang
MASTER_SITES=	https://golang.org/dl/
DISTNAME=	go${PORTVERSION}.src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Go programming language

LICENSE=	bsd3

BUILD_DEPENDS=	go14>=1.4:lang/go14

USES=		shebangfix
SHEBANG_LANG=	sh perl
SHEBANG_FILES=	misc/benchcmp \
		misc/nacl/go_nacl_*_exec \
		misc/wasm/go_js_wasm_exec \
		src/net/http/cgi/testdata/test.cgi
SHEBANG_GLOB=	*.bash *.pl *.sh

sh_OLD_CMD=	/bin/bash "/usr/bin/env bash"
sh_CMD=		${SH}

WRKSRC=		${WRKDIR}/go
ONLY_FOR_ARCHS=	i386 amd64 armv6 armv7

CONFLICTS_INSTALL=	go-devel

OPTIONS_DEFINE_i386=	GO387
GO387_DESC=	Do not generate code with SSE2 (for old x86 CPU)

.include <bsd.port.pre.mk>

.if defined(MAGUS)
NO_TEST=yes
.endif

.if ${ARCH} == i386
GOARCH=386
.elif ${ARCH} == "amd64"
GOARCH=amd64
.elif ${ARCH} == armv6 || ${ARCH} == armv7
GOARCH=arm
GOARM=${ARCH:C/armv//}
.else
IGNORE=		unknown arch ${ARCH}
.endif

.ifdef QEMU_EMULATING
IGNORE=		fails to build with qemu-user-static
.endif

.if ${PORT_OPTIONS:MGO387}
GO386=387
.endif

PLIST_SUB+=	opsys_ARCH=freebsd_${GOARCH}

post-patch:
	@cd ${WRKSRC} && ${FIND} . -name '*.orig' -delete
	@${REINPLACE_CMD} -e 's|^if ulimit -T|false \&\& &|' ${WRKSRC}/src/run.bash

do-build:
	cd ${WRKSRC}/src && \
		GOROOT=${WRKSRC} GOROOT_FINAL=${PREFIX}/go \
		GOROOT_BOOTSTRAP=${LOCALBASE}/go14 \
		GOBIN= GOARCH=${GOARCH} GOOS=freebsd \
		GO386=${GO386} GOARM=${GOARM} CGO_ENABLED=1 \
		${SH} make.bash -v
	-${RM} -r ${WRKSRC}/pkg/obj \
	    ${WRKSRC}/pkg/bootstrap \
	    ${WRKSRC}/pkg/freebsd_${GOARCH}/cmd

do-install:
	@${CP} -a ${WRKSRC} ${STAGEDIR}${PREFIX}
.for f in go gofmt
	@${LN} -sf ../go/bin/${f} ${STAGEDIR}${PREFIX}/bin/${f}
.endfor

do-test:
	cd ${WRKSRC}/src && GOROOT=${WRKSRC} PATH=${WRKSRC}/bin:${PATH} ${SH} run.bash -no-rebuild -banner ""

pkg-plist: stage
	${RM} ${WRKDIR}/pkg-plist
.for command in go gofmt
	${ECHO_CMD} bin/${command} >> ${WRKDIR}/pkg-plist
.endfor
	cd ${WRKDIR} && ${FIND} go -type f | \
		${SED} -e "s/\/freebsd_${GOARCH}\//\/%%opsys_ARCH%%\//g" | \
		${SORT} >> ${WRKDIR}/pkg-plist
	${CP} ${WRKDIR}/pkg-plist ${.CURDIR}/pkg-plist

.if !defined(_GO_MAKESUM_GUARD)
makesum:
	${MAKE} -D_GO_MAKESUM_GUARD makesum ARCH=${ONLY_FOR_ARCHS:O:[1]} DISTINFO_FILE=${DISTINFO_FILE}.tmp
.for arch in ${ONLY_FOR_ARCHS:O:[2..-1]}
	${MAKE} -D_GO_MAKESUM_GUARD makesum ARCH=${arch} DISTINFO_FILE=${DISTINFO_FILE}.${arch}
	${SED} 1d ${DISTINFO_FILE}.${arch} >> ${DISTINFO_FILE}.tmp
	${RM} ${DISTINFO_FILE}.${arch}
.endfor
	${AWK} '!seen[$$0]++' ${DISTINFO_FILE}.tmp > ${DISTINFO_FILE}
	${RM} ${DISTINFO_FILE}.tmp    
.endif

.include <bsd.port.post.mk>
