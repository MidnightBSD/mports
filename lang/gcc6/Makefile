PORTNAME=	gcc
PORTVERSION=	6.5.0
CATEGORIES=	lang java
MASTER_SITES=	GCC
PKGNAMESUFFIX=	${SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection 6

LICENSE=	gpl3

LIB_DEPENDS=	libgmp.so:math/gmp \
		libmpfr.so:math/mpfr \
		libmpc.so:math/mpc
BUILD_DEPENDS+=	${LOCALBASE}/bin/as:devel/binutils
RUN_DEPENDS+=	${LOCALBASE}/bin/as:devel/binutils

.if defined(MAINTAINER_MODE)
BUILD_DEPENDS+=	runtest:misc/dejagnu
.endif

CPE_VENDOR=	gnu

GCC_VERSION=	${PORTVERSION}
SUFFIX=		${PORTVERSION:C/([0-9]+).*/\1/}
USES=		compiler cpe gmake iconv libtool makeinfo perl5 tar:xz
USE_BINUTILS=	yes
USE_PERL5=	build
SSP_UNSAFE=	yes
CFLAGS:=      ${CFLAGS:N-mretpoline}
CXXFLAGS:=    ${CXXFLAGS:N-mretpoline}

OPTIONS_DEFINE=		BOOTSTRAP GRAPHITE JAVA
OPTIONS_DEFAULT=	BOOTSTRAP JAVA
BOOTSTRAP_DESC=		Build using a full bootstrap
GRAPHITE_DESC=		Support for Graphite loop optimizations

JAVA_USES=		python:build shebangfix
SHEBANG_FILES=	libjava/contrib/aot-compile.in

.if exists(/usr/lib32/libc.so)
MULTILIB_DESC=		Build support for 32-bit and 64-bit targets
MULTILIB_CONFIGURE_ENABLE=	multilib
.else
CONFIGURE_ARGS+=	--disable-multilib
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_TARGET=	x86_64-portbld-freebsd10.4
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
.endif

LANGUAGES:=	c,c++,objc,fortran
TARGLIB=	${PREFIX}/lib/gcc${SUFFIX}
LIBEXEC=	${PREFIX}/libexec/gcc${SUFFIX}
GNU_CONFIGURE=	yes
CONFIGURE_OUTSOURCE=	yes
.if empty(PORT_OPTIONS:MBOOTSTRAP)
CONFIGURE_ARGS+=--disable-bootstrap
.else
CONFIGURE_ARGS+=--with-build-config=bootstrap-debug
ALL_TARGET=	bootstrap-lean
.endif
CONFIGURE_ARGS+=--disable-nls \
		--enable-gnu-indirect-function \
		--libdir=${TARGLIB} \
		--libexecdir=${LIBEXEC} \
		--program-suffix=${SUFFIX} \
		--with-as=${LOCALBASE}/bin/as \
		--with-gmp=${LOCALBASE} \
		--with-gxx-include-dir=${TARGLIB}/include/c++/ \
		--with-ld=${LOCALBASE}/bin/ld \
		${ICONV_CONFIGURE_ARG} \
		--with-pkgversion="MidnightBSD Ports Collection" \
		--with-system-zlib
MAKE_ARGS+=	MAKEINFOFLAGS="--no-split"
USE_LDCONFIG=	${TARGLIB}
PLIST_SUB=	GCC_VERSION=${GCC_VERSION} \
		GNU_HOST=${CONFIGURE_TARGET} \
		SUFFIX=${SUFFIX}
INFO=		gcc${SUFFIX}/cpp \
		gcc${SUFFIX}/cppinternals \
		gcc${SUFFIX}/gcc \
		gcc${SUFFIX}/gccinstall \
		gcc${SUFFIX}/gccint \
		gcc${SUFFIX}/gfortran \
		gcc${SUFFIX}/libgomp
# Release tarballs (as opposed to snapshots) always carry this.
INFO+=		gcc${SUFFIX}/libquadmath \
		gcc${SUFFIX}/libitm
SUB_FILES=	pkg-message
SUB_LIST+=	TARGLIB=${TARGLIB}

.if ${PORT_OPTIONS:MGRAPHITE}
LIB_DEPENDS+=	libisl.so:devel/isl
CONFIGURE_ARGS+=--with-isl=${LOCALBASE}
.endif

.if ${PORT_OPTIONS:MJAVA}
ECJ_JAR=	${LOCALBASE}/share/java/ecj-4.5.jar
BUILD_DEPENDS+=	${ECJ_JAR}:lang/gcc-ecj45 \
		zip:archivers/zip
RUN_DEPENDS+=	${ECJ_JAR}:lang/gcc-ecj45
EXTRA_PATCHES+=	${FILESDIR}/java-patch-hier
CONFIGURE_ARGS+=--with-ecj-jar=${ECJ_JAR}
LANGUAGES:=	${LANGUAGES},java
INFO+=		gcc${SUFFIX}/cp-tools \
		gcc${SUFFIX}/gcj
PLIST_SUB+=	JAVA=""
.else
CONFIGURE_ARGS+=--disable-libgcj
PLIST_SUB+=	JAVA="@comment "
.endif
CONFIGURE_ARGS+=--enable-languages=${LANGUAGES}

pre-everything::
	@${ECHO_MSG} "Making GCC ${PORTVERSION} for ${CONFIGURE_TARGET} [${LANGUAGES}]"

pre-configure:
	cd ${WRKSRC} ; contrib/gcc_update --touch
	@${RM} ${WRKSRC}/gcc/*/*.info*

.if defined(MAINTAINER_MODE)
full-regression-test: build
	cd ${TEST_WRKSRC}; ${MAKE_CMD} -sk check \
	; ${WRKSRC}/contrib/test_summary
.endif

post-fake:
	${RM} ${FAKE_DESTDIR}${TRUE_PREFIX}/man/man7/*
	${RM} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/rebuild-gcj-db${SUFFIX} \
	        ${FAKE_DESTDIR}${TRUE_PREFIX}/man/man1/rebuild-gcj-db${SUFFIX}.1
	${RM} -r ${FAKE_DESTDIR}${TARGLIB}/gcc/*/${GCC_VERSION}/include-fixed/
	# Add target libraries and include files to packaging list.
	${RM} -f ${WRKDIR}/PLIST.lib
.for d in ${TARGLIB:S/^${PREFIX}\///} ${LIBEXEC:S/^${PREFIX}\///} include/gcj include/gnu include/java include/javax
	cd ${FAKE_DESTDIR}${TRUE_PREFIX} ; if [ -d $d ]; then \
	    ${FIND} $d -type f -o -type l >>${WRKDIR}/PLIST.lib ;\
	fi
.endfor
	cd ${WRKDIR} ; ${SED} -i -e "/PLIST.lib/ r PLIST.lib" ${TMPPLIST}

.include <bsd.port.post.mk>
