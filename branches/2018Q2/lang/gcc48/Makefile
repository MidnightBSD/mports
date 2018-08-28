# $MidnightBSD$

PORTNAME=	gcc
PORTVERSION=	4.8.5
CATEGORIES=	lang java
MASTER_SITES=	GCC/releases/gcc-${DISTVERSION}
PKGNAMESUFFIX=	${SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection 4.8

LICENSE=	gpl3

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp \
		libmpfr.so:${PORTSDIR}/math/mpfr \
		libmpc.so:${PORTSDIR}/math/mpc
BUILD_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils
RUN_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils

.if defined(MAINTAINER_MODE)
BUILD_DEPENDS+=	runtest:${PORTSDIR}/misc/dejagnu
.endif

CONFLICTS=	gcc-4.8.*
CPE_VENDOR=	gnu
CPE_VERSION=	${GCC_VERSION}
UNIQUENAME=	${PORTNAME}${PKGNAMESUFFIX}

# DISTVERSION relates to downloads, GCC_VERSION and SUFFIX to names
# of executables and directories once installed.
DISTVERSION=	${PORTVERSION}
GCC_VERSION=	${PORTVERSION:C/(.+)\.[0-9]{8}/\1/}
SUFFIX=		${PORTVERSION:C/([0-9]+).([0-9]+).*/\1\2/}

USES=		cpe gmake iconv libtool makeinfo perl5 tar:bzip2
USE_BINUTILS=	yes
USE_PERL5=	build
SSP_UNSAFE=	yes

PATCH_WRKSRC=	${SRCDIR}
CONFIGURE_SCRIPT=	../${SRCDIR:S/${WRKDIR}\///}/configure

OPTIONS_DEFINE=		BOOTSTRAP
OPTIONS_DEFINE_i386=	JAVA
OPTIONS_DEFINE_amd64=	JAVA
OPTIONS_DEFAULT=	BOOTSTRAP
OPTIONS_DEFAULT_i386=	JAVA
OPTIONS_DEFAULT_amd64=	JAVA
BOOTSTRAP_DESC=		Build using a full bootstrap

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd9.1
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd9.1
.endif

LANGUAGES:=	c,c++,objc,fortran
SRCDIR=		${WRKDIR}/gcc-${DISTVERSION}
WRKSRC=		${WRKDIR}/build
TARGLIB=	${PREFIX}/lib/gcc${SUFFIX}
LIBEXEC=	${PREFIX}/libexec/gcc${SUFFIX}
GNU_CONFIGURE=	yes
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
INFO+=		gcc${SUFFIX}/libquadmath \
		gcc${SUFFIX}/libitm
SUB_FILES=	pkg-message
SUB_LIST+=	TARGLIB=${TARGLIB}

.if ${PORT_OPTIONS:MJAVA}
ECJ_JAR=	${LOCALBASE}/share/java/ecj-4.5.jar
BUILD_DEPENDS+=	${ECJ_JAR}:${PORTSDIR}/lang/gcc-ecj45 \
		zip:${PORTSDIR}/archivers/zip
RUN_DEPENDS+=	${ECJ_JAR}:${PORTSDIR}/lang/gcc-ecj45
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
	cd ${SRCDIR} ; contrib/gcc_update --touch
	@${RM} -f ${SRCDIR}/gcc/*/*.info*
	@${MKDIR} ${CONFIGURE_WRKSRC}

.if defined(MAINTAINER_MODE)
full-regression-test: build
	cd ${WRKSRC}; ${MAKE_CMD} -sk check \
	; ${SRCDIR}/contrib/test_summary
.endif

post-install:
	${RM} -f ${PREFIX}/man/man7/*
	${RM} -f ${PREFIX}/bin/rebuild-gcj-db${SUFFIX} \
	         ${PREFIX}/man/man1/rebuild-gcj-db${SUFFIX}.1
	# Add target libraries and include files to packaging list.
	${RM} -f ${WRKDIR}/PLIST.lib
.for d in ${TARGLIB:S/^${PREFIX}\///} ${LIBEXEC:S/^${PREFIX}\///} include/gcj include/gnu include/java include/javax
	cd ${PREFIX} ; if [ -d $d ]; then \
	    ${FIND} $d -type f -o -type l >>${WRKDIR}/PLIST.lib ;\
	    ${FIND} $d -type d | ${SORT} -r \
	        | ${SED} -e 's/^/@dirrm /g' >>${WRKDIR}/PLIST.lib ;\
	fi
.endfor
	cd ${WRKDIR} ; ${SED} -i -e "/PLIST.lib/ r PLIST.lib" ${TMPPLIST}

.include <bsd.port.post.mk>
