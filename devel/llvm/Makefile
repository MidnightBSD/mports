# $MidnightBSD$

PORTNAME=	llvm
PORTVERSION=	2.7
CATEGORIES=	devel lang
MASTER_SITES=	http://llvm.org/releases/${PORTVERSION}/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low Level Virtual Machine
LICENSE=	agg

CONFLICTS=	llvm-devel-2.[0-9]*

GNU_CONFIGURE=	yes
USE_GCC=	4.2+
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_PERL5_BUILD=yes
MAKE_JOBS_SAFE=	yes

CONFIGURE_ARGS+=	--enable-optimized
CONFIGURE_ARGS+=	--enable-bindings=none

OPTIONS=	NO_ASSERTS	"Disable assertions" off

.if defined(NOPORTDOCS)
DOCSRCDIR=
.else
DOCSRCDIR=	docs
.endif

.if !defined(NOPORTDOCS)
MAN1=		bugpoint.1 lit.1 llc.1 lli.1 llvm-ar.1 \
		llvm-as.1 llvm-bcanalyzer.1 llvm-config.1 \
		llvm-dis.1 llvm-extract.1 llvm-ld.1 llvm-link.1 llvm-nm.1 \
		llvm-prof.1 llvm-ranlib.1 llvmc.1 llvmgcc.1 \
		llvmgxx.1 opt.1 tblgen.1
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000 && ${ARCH} == "amd64"
BROKEN=		does not compile
.elif ${ARCH} == "sparc64"
BROKEN=		does not compile on sparc64
.endif

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=	--enable-pic --with-pic
.endif

.if ${ARCH} == "i386"
CONFIGURE_ARGS+=	--with-optimize-option=-O2
.endif

.ifdef(WITH_NO_ASSERTS)
CONFIGURE_ARGS+=	--disable-assertions
.else
CONFIGURE_ARGS+=	--enable-assertions
.endif

post-patch:
	${REINPLACE_CMD} -e 's|\(PROJ_docsdir.*:=\).*$$|\1${DOCSDIR}|g' \
	    ${WRKSRC}/Makefile.config.in
	${REINPLACE_CMD} -e 's|\(PROJ_mandir.*:=\).*$$|\1${MANPREFIX}/man|g' \
	    ${WRKSRC}/Makefile.config.in
	${REINPLACE_CMD} -e 's|%%DOCSRCDIR%%|${DOCSRCDIR}|' \
	    ${WRKSRC}/Makefile

TEST_CMD=	'(cd ${WRKSRC}/test; ${SETENV} ${MAKE_ENV} ${GMAKE} check)'
regression-test: ${BUILD_COOKIE}
	if [ `${ID} -u` = 0 ]; then \
		${CHOWN} -R nobody ${WRKSRC}/test; \
		su -m nobody -c ${TEST_CMD}; \
	else \
		${SH} -c ${TEST_CMD}; \
	fi

PLIST_FILE_LIST=	bin/bugpoint \
			bin/llc \
			bin/lli \
			bin/llvm* \
			bin/opt \
			bin/tblgen \
			lib/libCompilerDriver.a \
			lib/libEnhancedDisassembly.so \
			lib/libEnhancedDisassembly.a \
			lib/libLTO.* \
			lib/libLLVM* \
			lib/libUnitTestMain.a \
			lib/libplugin_llvmc* \
			lib/libprofile_rt.so
PLIST_DIR_LIST=		include/llvm-c \
			include/llvm
build-plist:
	${RM} -f ${PLIST}
	cd ${PREFIX} && \
	    (ls ${PLIST_FILE_LIST}; ${FIND} ${PLIST_DIR_LIST} -type f) | \
	    ${SORT} >> ${PLIST}
	${FIND} ${DATADIR} ${DOCSDIR} -type f | \
	    ${SED} -e 's|${DATADIR}|%%DATADIR%%|' \
	     -e 's|${DOCSDIR}|%%PORTDOCS%%%%DOCSDIR%%|' | ${SORT} >> ${PLIST}
	cd ${PREFIX} && \
	    ${FIND} ${PLIST_DIR_LIST} -type d | \
	    ${SORT} -r | ${SED} -e 's|^|@dirrm |' >> ${PLIST}
	${FIND} ${DOCSDIR} -type d | ${SORT} -r | \
	    ${SED} -e 's|${DATADIR}|%%DATADIR%%|' \
	     -e 's|${DOCSDIR}|%%DOCSDIR%%|' \
	     -e 's|^|%%PORTDOCS%%@dirrm |' >> ${PLIST}

.include <bsd.port.post.mk>
