# $MidnightBSD$

PORTNAME=	gcc
PORTVERSION=	4.6.4
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	lang java
MASTER_SITES=	${MASTER_SITE_GCC}
MASTER_SITE_SUBDIR=	releases/gcc-${VERSIONSTRING}
PKGNAMESUFFIX=	${SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection 4.6

LICENSE=	gpl3

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp \
		libmpfr.so:${PORTSDIR}/math/mpfr \
		libmpc.so:${PORTSDIR}/math/mpc
BUILD_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils
RUN_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils

.if defined(MAINTAINER_MODE)
BUILD_DEPENDS+=	runtest:${PORTSDIR}/misc/dejagnu
.endif

CPE_VENDOR=	gnu
# VERSIONSTRING relates to downloads, GCC_VERSION and SUFFIX to names
# of executables and directories once installed.
VERSIONSTRING=	${PORTVERSION}
GCC_VERSION=	${PORTVERSION:C/(.+)\.[0-9]{8}/\1/}
SUFFIX=		${PORTVERSION:C/([0-9]+).([0-9]+).*/\1\2/}
LATEST_LINK=	gcc${SUFFIX}${PKGNAMESUFFIX}
USE_BINUTILS=	yes
USE_BISON=	build
USES=		cpe gmake iconv libtool makeinfo perl5 tar:bzip2
USE_PERL5_BUILD=yes
SSP_UNSAFE=	yes

PATCH_WRKSRC=	${SRCDIR}
CONFIGURE_SCRIPT=	../${SRCDIR:S/${WRKDIR}\///}/configure

OPTIONS_DEFINE_i386=	JAVA
OPTIONS_DEFINE_amd64=	JAVA
OPTIONS_DEFAULT_i386=	JAVA
OPTIONS_DEFAULT_amd64=	JAVA

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd9.1
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd9.1
.endif

LANGUAGES:=	c,c++,objc,fortran
SRCDIR=		${WRKDIR}/gcc-${VERSIONSTRING}
WRKSRC=		${WRKDIR}/build
TARGLIB=	${PREFIX}/lib/gcc${SUFFIX}
LIBEXEC=	${PREFIX}/libexec/gcc${SUFFIX}
GNU_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ARGS+=--disable-bootstrap \
		--disable-nls \
		--libdir=${TARGLIB} \
		--libexecdir=${LIBEXEC} \
		--program-suffix=${SUFFIX} \
		--with-as=${LOCALBASE}/bin/as \
		--with-gmp=${LOCALBASE} \
		--with-gxx-include-dir=${TARGLIB}/include/c++/ \
		--with-ld=${LOCALBASE}/bin/ld \
		--with-libiconv-prefix=${LOCALBASE} \
		--with-pkgversion="MidnightBSD Ports Collection" \
		--with-system-zlib
MAKE_ARGS+=	MAKEINFOFLAGS="--no-split"
USE_LDCONFIG=	${TARGLIB}
PLIST_SUB=	GCC_VERSION=${GCC_VERSION} \
		GNU_HOST=${CONFIGURE_TARGET} \
		SUFFIX=${SUFFIX}

.if ${PORT_OPTIONS:MJAVA}
ECJ_JAR=	${LOCALBASE}/share/java/ecj-4.5.jar
BUILD_DEPENDS+=	${ECJ_JAR}:${PORTSDIR}/lang/gcc-ecj45 \
		zip:${PORTSDIR}/archivers/zip
RUN_DEPENDS+=	${ECJ_JAR}:${PORTSDIR}/lang/gcc-ecj45
EXTRA_PATCHES+=	${FILESDIR}/java-patch-hier
CONFIGURE_ARGS+=--with-ecj-jar=${ECJ_JAR}
LANGUAGES:=	${LANGUAGES},java
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
	cd ${WRKSRC}; ${GMAKE} -sk check
.endif

post-install:
	${RM} -f ${PREFIX}/man/man7/fsf-funding.7 \
	         ${PREFIX}/man/man7/gfdl.7 ${PREFIX}/man/man7/gpl.7
	${RM} -f ${TARGLIB}/*.la
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
	@if type ccache-update-links >/dev/null 2>&1; then \
	    ccache-update-links -v; \
	fi

.include <bsd.port.post.mk>
