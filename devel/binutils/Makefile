PORTNAME=	binutils
PORTVERSION=	2.40
PORTREVISION?=	1
CATEGORIES=	devel
MASTER_SITES=	SOURCEWARE/binutils/releases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU binary tools
WWW=		https://www.gnu.org/software/binutils/

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

FLAVORS=	native aarch64 aarch64_none_elf amd64 arm_gnueabi arm_none_eabi \
		avr i386 riscv64 \
		riscv64_none_elf riscv32_unknown_elf
FLAVOR?=	native

RELRO_CONFIGURE_ON=	--enable-relro
BUILD_DEPENDS=	${LOCALBASE}/lib/libgmp.so:math/gmp \
		${LOCALBASE}/lib/libmpfr.so:math/mpfr

CONFLICTS=	libbfd-[0-9]*

#TEST_DEPENDS+=	runtest:misc/dejagnu
#TEST_TARGET=	check
NO_TEST=	yes

OPTIONS_DEFINE=	NLS RELRO STATIC
STATIC_PREVENTS=	NLS

RELRO_DESC=	Enable relocation memory corruption mitigation (-z relro) by default

LICENSE_FILE_GPLv3=	${WRKSRC}/COPYING3
LICENSE_FILE_LGPL3=	${WRKSRC}/COPYING3.LIB

USES=		bison:alias cpe gmake libtool makeinfo tar:xz compiler:env gettext localbase
CPE_VENDOR=	gnu
GNU_CONFIGURE=	yes

RELRO_CONFIGURE_OFF=	--enable-relro=no
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

STATIC_LDFLAGS+=	-all-static

aarch64_COMMENT=	GNU binutils for ${FLAVOR} development

.include <bsd.mport.options.mk>

.if ${OSVERSION} < 300000
FTARGET=freebsd11.4
.else
FTARGET=freebsd12.3
.endif

.if ${FLAVOR} != native
PKGNAMEPREFIX=	${FLAVOR:C/_/-/g}-
PLIST=		${PKGDIR}/pkg-plist-${FLAVOR:C/_/-/g}

.if ${PKGNAMEPREFIX:M*-*-}
BUTARGET?=	${PKGNAMEPREFIX}${FTARGET}
.else
BUTARGET?=	${PKGNAMEPREFIX}unknown-${FTARGET}
.endif
PLIST_SUB=	BUTARGET=${BUTARGET}
OPTIONS_EXCLUDE=	NLS
INFO_PATH=	${PKGNAMEPREFIX:S/-$//}/share/info

.if ${FLAVOR} == aarch64
.elif ${FLAVOR} == aarch64_none_elf || ${FLAVOR} == arm_none_eabi || ${FLAVOR} == riscv64_none_elf || ${FLAVOR} == mingw32 || ${FLAVOR} == avr || ${FLAVOR} == riscv32_unknown_elf
BUTARGET=	${FLAVOR:C/_/-/g}
.elif ${FLAVOR} == amd64
BUTARGET=	x86_64-unknown-${FTARGET}
.endif

CONFIGURE_ARGS+=	--disable-shared \
			--target=${BUTARGET}
.endif

.if ${FLAVOR} == native
PKGNAMEPREFIX=	native-
BUREMOVE=	coffdump \
		dlltool \
		dllwrap \
		nlmconv \
		srconv \
		sysdump \
		windmc \
		windres
USES+=		localbase
CONFIGURE_ARGS+=	--with-system-zlib \
			--with-gmp=${LOCALBASE} \
			--with-mpfr=${LOCALBASE} \
			--enable-targets=all \
			--enable-threads=yes
INFO=		as \
		binutils \
		gprof \
		bfd \
		ld
.endif

CONFIGURE_ARGS+=	--disable-werror \
			--enable-deterministic-archives \
			--with-sysroot=/ \
			--enable-x86-relax-relocations=no

MAKE_ENV+=	ac_cv_func_sbrk=0
MAKE_ARGS+=	LIBDL=""

.include <bsd.port.pre.mk>

# Actual earliest version may differ slightly
.if (${ARCH} != sparc64 && ${ARCH} != mips && ${ARCH} != mips64 && ${ARCH} != powerpcspe && ${ARCH} != powerpc && ${ARCH} != powerpc64 && ${ARCH} != riscv64 && ${FLAVOR} == native) || ((${ARCH} == powerpc || ${ARCH} == powerpc64) && ${CHOSEN_COMPILER_TYPE} != gcc && ${FLAVOR} == native)
CONFIGURE_ARGS+=	--enable-gold --enable-plugins
CXXFLAGS+=	-Wno-c++11-narrowing
PLIST_SUB+=	GOLD=""
.else
PLIST_SUB+=	GOLD="@comment "
.endif

CONFIGURE_ARGS+=      --disable-initfini-array
.if ${ARCH} == amd64
.if ${OSVERSION} < 300000
CONFIGURE_TARGET=	x86_64-portbld-freebsd11.4
.else
CONFIGURE_TARGET=	x86_64-portbld-freebsd12.3
.endif
.else
.if ${OSVERSION} < 300000
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.3
.endif
.endif

post-patch:
	${REINPLACE_CMD} -e "s/-ldl//g" ${WRKSRC}/gold/testsuite/Makefile.in

post-install:
.if ${FLAVOR} == native
	${INSTALL_DATA} ${WRKSRC}/include/plugin-api.h ${PREFIX}/include/
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} ! -type d | \
		${SED} -e 's,^${PREFIX}/,,' >> ${TMPPLIST}
	-${RM} ${PREFIX}/include/ansidecl.h
	${REINPLACE_CMD} '/#include "ansidecl.h"/d' ${PREFIX}/include/bfd.h
.else
.if ${PKGNAMEPREFIX:S/-$//} != ${BUTARGET}
	${RM} -r ${PREFIX}/${PKGNAMEPREFIX:S/-$//}
.endif
	-${RM} ${PREFIX}/${BUTARGET}/lib/ldscripts/i386bsd.*
	@if [ -d ${PREFIX}/${INFO_PATH:H} ] ; then rm -rf ${PREFIX}/${INFO_PATH:H}; fi
	${LN} -fs ../../bin/${BUTARGET}-size ${PREFIX}/${BUTARGET}/bin/size
.endif
.for tool in ${BUREMOVE}
	-${RM} ${PREFIX}/bin/${BUTARGET}-${tool} \
	    ${PREFIX}/bin/${tool} \
	    ${PREFIX}/man/man1/${BUTARGET}-${tool}.1 \
	    ${PREFIX}/man/man1/${tool}.1 \
	    ${PREFIX}/${BUTARGET}/bin/${tool}
.endfor
.if defined(BUREMOVE) && ${BUREMOVE:Mld}
	-${RM} -r ${PREFIX}/${BUTARGET}/lib/ldscripts
.endif

.include <bsd.port.post.mk>
