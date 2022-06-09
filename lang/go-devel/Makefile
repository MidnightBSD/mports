# Created by: Devon H. O'Dell <devon.odell@gmail.com>

PORTNAME=	go
DISTVERSION?=	g20220319
PORTREVISION?=	0
CATEGORIES=	lang
MASTER_SITES?=	https://github.com/dmgk/go-bootstrap/releases/download/${BOOTSTRAP_TAG}/:bootstrap \
		FREEBSD_LOCAL/dmgk:bootstrap
PKGNAMESUFFIX=	${DISTVERSION:C/^g[0-9]+/-devel/:C/^([0-9]+)\.([0-9]+).*/\1\2/}
DISTFILES?=	go-freebsd-${GOARCH_${ARCH}}${GOARM_${ARCH}}-${BOOTSTRAP_TAG}.tar.xz:bootstrap

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Go programming language (development version)

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

.ifdef QEMU_EMULATING
IGNORE=		fails to build with qemu-user-static
.endif

ONLY_FOR_ARCHS=	amd64 i386

RUN_DEPENDS=	${RUN_DEPENDS_${ARCH}}
# ld.bfd from devel/binutils is needed for working cgo on aarch64
RUN_DEPENDS_aarch64=	binutils>0:devel/binutils

NO_TEST=	yes

USES=		cpe shebangfix

CPE_VENDOR=	golang

.ifndef MASTERDIR
USE_GITHUB=	yes
GH_ACCOUNT=	golang
GH_TAGNAME=	4aa1efed4853ea067d665a952eee77c52faac774
.endif

SHEBANG_FILES=	misc/wasm/go_js_wasm_exec \
		src/net/http/cgi/testdata/test.cgi
SHEBANG_GLOB=	*.bash *.pl *.sh

# Upstream archive contains files with UTF-8 names
EXTRACT_CMD=	${SETENV} LC_ALL=en_US.UTF-8 ${TAR}

.ifndef GH_TAGNAME
.endif

OPTIONS_DEFINE_i386=	SOFTFLOAT
SOFTFLOAT_DESC=	Use soft float on non-SSE2 processors (Pentium 4 and older)
SOFTFLOAT_VARS=	GO386=softfloat

BOOTSTRAP_TAG=	go1.17.9
GO_SUFFIX=	${PKGNAMESUFFIX}

GOARCH_amd64=	amd64
GOARCH_i386=	386

post-extract:
	@[ -z "${GH_TAGNAME}" ] || \
		${ECHO_CMD} "devel ${DISTVERSION}-${GH_TAGNAME} freebsd/${GOARCH_${ARCH}}" > ${WRKSRC}/VERSION

post-patch:
	@${REINPLACE_CMD} -e 's|type -ap |type |' ${WRKSRC}/src/make.bash
	@${REINPLACE_CMD} -e 's|^if ulimit -T|false \&\& &|' ${WRKSRC}/src/run.bash

pre-build:
 	# Check that the running kernel has COMPAT_FREEBSD11 required by lang/go{,-devel} post-ino64
	@${SETENV} CC="${CC}" OPSYS="freebsd" OSVERSION="${OSVERSION}" WRKDIR="${WRKDIR}" \
		${SH} ${SCRIPTSDIR}/rust-compat11-canary.sh

do-build:
	cd ${WRKSRC}/src ; ${SETENV} \
		XDG_CACHE_HOME=${WRKDIR} \
		GOROOT_BOOTSTRAP=${WRKDIR}/go-freebsd-${GOARCH_${ARCH}}${GOARM_${ARCH}}-bootstrap \
		GOROOT=${WRKSRC} \
		GOROOT_FINAL=${PREFIX}/go${GO_SUFFIX} \
		GOBIN= \
		GOOS=freebsd \
		GOARCH=${GOARCH_${ARCH}} \
		GO386=${GO386} \
		GOARM=${GOARM_${ARCH}} \
		CC=${CC} \
		${SH} make.bash -v

do-install:
	-cd ${WRKSRC} ; \
		${RM} -r .gitattributes .gitignore .github favicon.ico robots.txt \
		pkg/obj pkg/bootstrap pkg/freebsd_${GOARCH_${ARCH}}/cmd
	@${MKDIR} ${PREFIX}/go${GO_SUFFIX}
	@${CP} -a ${WRKSRC}/* ${PREFIX}/go${GO_SUFFIX}
.for f in go gofmt
	${LN} -sf ../go${GO_SUFFIX}/bin/${f} ${PREFIX}/bin/${f}${GO_SUFFIX}
	@${ECHO_CMD} bin/${f}${GO_SUFFIX} >> ${TMPPLIST}
.endfor
	-${RM} -rf ${PREFIX}/go${GO_SUFFIX}/test/fixedbugs
	@cd ${PREFIX} && ${FIND} go${GO_SUFFIX} -type f >> ${TMPPLIST}

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

.include <bsd.port.mk>
