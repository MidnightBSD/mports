# ex:ts=8
# Ports collection makefile for:	gcc
# Date created:				March 23, 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/lang/gcc43/Makefile,v 1.4 2008/07/14 03:29:47 laffer1 Exp $
#

PORTNAME=	gcc
PORTVERSION=	4.3.2
PORTREVISION=	20080710
CATEGORIES=	lang java
VERSIONSTRING=	4.3-${PORTREVISION}
MASTER_SITES=	${MASTER_SITE_GCC}
MASTER_SITE_SUBDIR=	snapshots/${VERSIONSTRING}
DISTFILES=	gcc-core-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-fortran-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-g++-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-objc-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-testsuite-${VERSIONSTRING}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection 4.3
LICENSE=	gpl3

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp \
		mpfr.2:${PORTSDIR}/math/mpfr

SUFFIX=		43
LATEST_LINK?=	gcc${SUFFIX}${PKGNAMESUFFIX}
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_PERL5_BUILD=yes
WANT_GNOME=	yes

PATCH_WRKSRC=	${SRCDIR}
CONFIGURE_SCRIPT=	../${SRCDIR:C/${WRKDIR}//}/configure

.include <bsd.port.pre.mk>

.if ${ARCH} != i386 || defined(PACKAGE_BUILDING)
WITHOUT_JAVA=	yes
.endif

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd6.1
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd6.1
.endif

SRCDIR=		${WRKDIR}/gcc-${VERSIONSTRING}
WRKSRC=		${WRKDIR}/build
TARGLIB=	${PREFIX}/lib/gcc-${PORTVERSION}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-nls \
		--with-system-zlib \
		--with-libiconv-prefix=${LOCALBASE} \
		--with-gmp=${LOCALBASE} \
		--program-suffix=${SUFFIX} \
		--libdir=${TARGLIB} \
		--with-gxx-include-dir=${TARGLIB}/include/c++/ \
		--infodir=${PREFIX}/${INFO_PATH}/gcc${SUFFIX}
MAKE_ARGS+=	MAKEINFOFLAGS="--no-split"
ALL_TARGET=	bootstrap-lean
USE_LDCONFIG=	${TARGLIB}
PLIST_SUB=	GCC_VER=${PORTVERSION} GNU_HOST=${CONFIGURE_TARGET} \
		SUFFIX=${SUFFIX}
MAN1=		cpp${SUFFIX}.1 \
		g++${SUFFIX}.1 \
		gcc${SUFFIX}.1 \
		gcov${SUFFIX}.1 \
		gfortran${SUFFIX}.1
INFO=		gcc${SUFFIX}/cpp \
		gcc${SUFFIX}/cppinternals \
		gcc${SUFFIX}/gcc \
		gcc${SUFFIX}/gccinstall \
		gcc${SUFFIX}/gccint \
		gcc${SUFFIX}/gfortran \
		gcc${SUFFIX}/libgomp

.if ! defined(WITHOUT_JAVA)
DISTFILES+=	gcc-java-${VERSIONSTRING}${EXTRACT_SUFX}
BUILD_DEPENDS+=	zip:${PORTSDIR}/archivers/zip
EXTRA_PATCHES+=	${FILESDIR}/java-patch-hier
CONFIGURE_ARGS+=--disable-rpath
MAN1+=		gappletviewer${SUFFIX}.1 \
		gc-analyze${SUFFIX}.1 \
		gcj${SUFFIX}.1 \
		gcj-dbtool${SUFFIX}.1 \
		gcjh${SUFFIX}.1 \
		gij${SUFFIX}.1 \
		gjar${SUFFIX}.1 \
		gjarsigner${SUFFIX}.1 \
		gjavah${SUFFIX}.1 \
		gjnih${SUFFIX}.1 \
		gkeytool${SUFFIX}.1 \
		gnative2ascii${SUFFIX}.1 \
		gorbd${SUFFIX}.1 \
		grmic${SUFFIX}.1 \
		grmid${SUFFIX}.1 \
		grmiregistry${SUFFIX}.1 \
		grepjar${SUFFIX}.1 \
		gserialver${SUFFIX}.1 \
		gtnameserv${SUFFIX}.1 \
		jar${SUFFIX}.1 \
		jcf-dump${SUFFIX}.1 \
		jv-scan${SUFFIX}.1 jv-convert${SUFFIX}.1 \
		rmic${SUFFIX}.1 rmiregistry${SUFFIX}.1
INFO+=		gcc${SUFFIX}/cp-tools \
		gcc${SUFFIX}/gcj
PLIST_SUB+=	JAVA=""

.if defined(WITH_JAVA_AWT)
LIB_DEPENDS+=	cairo.2:${PORTSDIR}/graphics/cairo
USE_GNOME=	gtk20 libartlgpl2
CONFIGURE_ARGS+=	--enable-java-awt=gtk,xlib \
			--enable-gtk-cairo
.endif

.else
CONFIGURE_ARGS+=--disable-libgcj
PLIST_SUB+=	JAVA="@comment "
.endif

pre-everything::
	@${ECHO_MSG} "Making GCC ${DISTNAME:S/^gcc-//} for ${OPSYS} ${OSREL}  target=${CONFIGURE_TARGET}"
.if ! defined(WITHOUT_JAVA)
	@DSIZ=700000; DSIZBYTE=734003200; \
	if [ `ulimit -d` -lt $$DSIZ ]; then \
	  echo "You need to increase the datasize limit to at least $$DSIZ \
	    (and set kern.maxdsiz=\"$$DSIZBYTE\" in /boot/loader.conf) to \
	    build with Java support." | ${FMT} -s; \
	  exit 1; \
	fi
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\(const char version_string.*\)";|\1 [FreeBSD]";|' \
	    ${SRCDIR}/gcc/version.c

pre-configure:
	cd ${SRCDIR} ; contrib/gcc_update --touch
	@${RM} -f ${SRCDIR}/gcc/*/*.info*
	@${MKDIR} ${CONFIGURE_WRKSRC}

post-build:
	@${ECHO_MSG} "Consider running 'make check' before 'make install', especially"
	@${ECHO_MSG} "if you have not performed this build on CURRENT."
	@${ECHO_MSG} "This assumes that you have the dejagnu port installed."

check: build
	cd ${WRKSRC}; export RUNTESTFLAGS='--target_board ''unix{-pthread}'''; ${GMAKE} -sk check

post-install:
	# man pages can only be generated if Perl >= 5.6 is installed;
	# fake them otherwise.
	for mp in ${_MANPAGES}; do \
	  ${TEST} -e $${mp} || ${TOUCH} ${TOUCH_FLAGS} $${mp}; \
	done
	${RM} -f ${PREFIX}/man/man7/fsf-funding.7 \
	         ${PREFIX}/man/man7/gfdl.7 ${PREFIX}/man/man7/gpl.7
	${RM} -f ${TARGLIB}/*.la
	# Add target libraries and include files to packaging list.
	${RM} -f ${WRKDIR}/PLIST.lib
.for d in ${TARGLIB:S/^${PREFIX}\///} libexec/gcc/${CONFIGURE_TARGET}/${PORTVERSION} include/gcj include/gnu include/java include/javax
	cd ${PREFIX} ; if [ -d $d ]; then \
	    ${FIND} $d -type f -o -type l >>${WRKDIR}/PLIST.lib ;\
	    ${FIND} $d -type d | ${SORT} -r \
	        | ${SED} -e 's/^/@dirrm /g' >>${WRKDIR}/PLIST.lib ;\
	fi
.endfor
	${ECHO_CMD} "@unexec ${RMDIR} %D/libexec/gcc/${CONFIGURE_TARGET} 2>&1 || true" >> ${WRKDIR}/PLIST.lib
	${ECHO_CMD} "@unexec ${RMDIR} %D/libexec/gcc 2>&1 || true" >> ${WRKDIR}/PLIST.lib
	cd ${WRKDIR} ; ${SED} -i -e "/PLIST.lib/ r PLIST.lib" ${TMPPLIST}

.include <bsd.port.post.mk>
