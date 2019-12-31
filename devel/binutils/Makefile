PORTNAME=	binutils
PORTVERSION=	2.32
PORTREVISION?=	1
CATEGORIES=	devel
MASTER_SITES=	SOURCEWARE/binutils/releases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU binary tools

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

#EXTRA_PATCHES=	${FILESDIR}/binutils-do-not-provide-shared-section-symbols.patch:-p1
BUILD_DEPENDS=	${LOCALBASE}/lib/libgmp.so:math/gmp \
		${LOCALBASE}/lib/libmpfr.so:math/mpfr

CONFLICTS=	libbfd-[0-9]*

OPTIONS_DEFINE=	NLS

LICENSE_FILE_GPLv3=	${WRKSRC}/COPYING3
LICENSE_FILE_LGPL3=	${WRKSRC}/COPYING3.LIB

USES=		bison cpe gmake libtool tar:bzip2 compiler:env
CPE_VENDOR=	gnu
GNU_CONFIGURE=	yes

.if defined(PKGNAMEPREFIX)
BUTARGET?=	${PKGNAMEPREFIX}${OPSYS:tl}
OPTIONS_EXCLUDE=	NLS
INFO_PATH=	${PKGNAMEPREFIX:S/-$//}/info
CONFIGURE_ARGS+=	--disable-shared \
			--target=${BUTARGET}
.else
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-system-zlib \
			--with-gmp=${LOCALBASE} \
			--with-mpfr=${LOCALBASE} \
			--enable-targets=all \
			--enable-threads=yes \
			--enable-relro=yes
INFO=		as \
		binutils \
		gprof \
		bfd \
		ld
.endif

CONFIGURE_ARGS+=	--disable-werror \
			--with-sysroot=/ \
			--enable-deterministic-archives \
			--enable-x86-relax-relocations=no
MAKE_ENV+=	ac_cv_func_sbrk=0
MAKE_ARGS+=	LIBDL=""

OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls
STATIC_LDFLAGS+=      -all-static

.include <bsd.port.pre.mk>

# Actual earliest version may differ slightly
.if ${OSVERSION} >= 98000 && !defined(PKGNAMEPREFIX) && (${COMPILER_TYPE} == clang && ${COMPILER_VERSION} >= 34 || ${COMPILER_TYPE} == gcc)
CONFIGURE_ARGS+=	--enable-gold --enable-plugins
CXXFLAGS+=	-Wno-c++11-narrowing
PLIST_SUB+=	GOLD=""
.else
PLIST_SUB+=	GOLD="@comment "
.endif

CONFIGURE_ARGS+=      --disable-initfini-array
.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd10.4
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
.endif

post-install:
.if !defined(PKGNAMEPREFIX)
	${INSTALL_DATA} ${WRKSRC}/include/plugin-api.h ${PREFIX}/include/
	@${FIND} -ds ${STAGEDIR}${PREFIX}/${CONFIGURE_TARGET} ! -type d | \
		${SED} -e 's,^${PREFIX}/,,' >> ${TMPPLIST}
	${RM} ${STAGEDIR}${PREFIX}/include/ansidecl.h
	${REINPLACE_CMD} '/#include "ansidecl.h"/d' ${PREFIX}/include/bfd.h
.else
.if ${PKGNAMEPREFIX:S/-$//} != ${BUTARGET}
	${RM} -rf ${PREFIX}/${PKGNAMEPREFIX:S/-$//}
.endif
	${LN} -fs ../../bin/${BUTARGET}-size ${PREFIX}/${BUTARGET}/bin/size
.endif

.include <bsd.port.post.mk>
