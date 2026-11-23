PORTNAME=	zig
DISTVERSION=	0.17.0
CATEGORIES=	lang
MASTER_SITES=	https://ziglang.org/download/${DISTVERSION}/ \
		https://ziglang.org/builds/
PKGNAMESUFFIX=	017

PATCH_SITES=	https://github.com/ziglang/${PORTNAME}/commit/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Language for robustness, optimality, and maintainability (0.17)
WWW=		https://ziglang.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64
ONLY_FOR_ARCHS_REASON=	not yet supported

BUILD_DEPENDS=	llvm${_LLVM_VER}>=0:devel/llvm${_LLVM_VER}

LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		cmake compiler:c++11-lang localbase:ldflags tar:xz
CMAKE_ARGS+=	-DZIG_TARGET_MCPU=baseline # ensure we run everywhere
CMAKE_ARGS+=	-DCMAKE_PROGRAM_PATH=${LOCALBASE}/llvm${_LLVM_VER}/bin
CMAKE_ON=	THREADS_PREFER_PTHREAD_FLAG

# Installed self-contained under lib/zig017 so it coexists with lang/zig.
# zig finds its standard library relative to the real executable path.
ZIG_HOME_REL=	lib/${PORTNAME}${PKGNAMESUFFIX}
CMAKE_INSTALL_PREFIX=	${PREFIX}/${ZIG_HOME_REL}
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=		DOCS STATIC
OPTIONS_DEFAULT=	DOCS

STATIC_DESC=	sets ZIG_STATIC to avoid 800MiB LLVM runtime dependency

STATIC_RUN_DEPENDS_OFF=	llvm${_LLVM_VER}>=0:devel/llvm${_LLVM_VER}
STATIC_CMAKE_BOOL=	ZIG_STATIC
STATIC_LDFLAGS=		-licudata -licuuc -llzma -lm -lmd -lxml2 -lz -lzstd
STATIC_LIB_DEPENDS+=	libxml2.so:textproc/libxml2

_LLVM_VER=	22
_ZIG_BIN=	${PREFIX}/${ZIG_HOME_REL}/bin/zig

post-configure-STATIC-on:
	@${REINPLACE_CMD} 's/-Wl,-Bdynamic//' \
		${BUILD_WRKSRC}/build.ninja

post-install:
# Zig install creates this dir, which causes check-plist error
	@${RM} -rf ${FAKE_DESTDIR}/wrkdirs

	${MKDIR} ${PREFIX}/bin
	${RLN} ${PREFIX}/${ZIG_HOME_REL}/bin/zig ${PREFIX}/bin/zig017
	@${ECHO_CMD} bin/zig017 >> ${TMPPLIST}
# Automatically create the PLIST file
	@${FIND} -s ${PREFIX}/${ZIG_HOME_REL} -not -type d | ${SORT} | \
		${SED} -e 's#^${PREFIX}/##' >> ${TMPPLIST}
	@${FIND} -s ${PREFIX}/${ZIG_HOME_REL} -type d | ${SORT} -r | \
		${SED} -e 's#^${PREFIX}/##; s#^#@dir #' >> ${TMPPLIST}

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/std
.for f in index.html main.js
	${INSTALL_MAN} ${WRKSRC}/lib/docs/${f} \
		${FAKE_DESTDIR}${DOCSDIR}/${f}
.endfor
	@cd ${FAKE_DESTDIR}; ${FIND} ${DOCSDIR:C@^/@@} -type f | ${SED} -e 's@^@/@' | ${SORT} | \
		${SED} -e 's#^${PREFIX}/##' >> ${TMPPLIST}
	@${ECHO_CMD} "@dir ${DOCSDIR_REL}/std" >> ${TMPPLIST}
	@${ECHO_CMD} "@dir ${DOCSDIR_REL}" >> ${TMPPLIST}

do-test:
	${MKDIR} ${WRKDIR}/cache
	(cd ${WRKSRC} && \
		${FAKE_DESTDIR}${TRUE_PREFIX}/bin/zig build test-behavior -j${MAKE_JOBS_NUMBER} --cache-dir ${WRKDIR}/cache \
		--global-cache-dir ${WRKDIR}/cache --zig-lib-dir ${WRKSRC}/lib)

.include <bsd.port.mk>
