# $MidnightBSD$

PORTNAME=	binutils
PORTVERSION=	2.24
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEWARE}
MASTER_SITE_SUBDIR=	binutils/releases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU binary tools

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	${LOCALBASE}/lib/libgmp.so:${PORTSDIR}/math/gmp \
		${LOCALBASE}/lib/libmpfr.so:${PORTSDIR}/math/mpfr

CONFLICTS=	libbfd-[0-9]*

OPTIONS_DEFINE=	NLS

LICENSE_FILE_GPLv3=	${WRKSRC}/COPYING3
LICENSE_FILE_LGPL3=	${WRKSRC}/COPYING3.LIB

USES=		bison gmake libtool tar:bzip2
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
			--with-mpfr=${LOCALBASE}
INFO=		as \
		binutils \
		standards \
		gprof \
		bfd \
		configure \
		ld
.endif

CONFIGURE_ARGS+=	--disable-werror \
			--with-sysroot=/

OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.mport.options.mk>

# Actual earliest version may differ slightly
.if ${OSVERSION} >= 4016
CONFIGURE_ARGS+=	--enable-gold --enable-plugins
PLIST_SUB+=	GOLD=""
.else
PLIST_SUB+=	GOLD="@comment "
.endif

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd9.1
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd9.1
.endif

post-install:
.if !defined(PKGNAMEPREFIX)
.if ${OSVERSION} >= 4016
	${INSTALL_DATA} ${WRKSRC}/include/plugin-api.h ${PREFIX}/include/
.endif
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} ! -type d | \
		${SED} -e 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} -type d | \
		${SED} -e 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}
	${RM} ${PREFIX}/include/ansidecl.h
	${REINPLACE_CMD} '/#include "ansidecl.h"/d' ${PREFIX}/include/bfd.h
.else
	${RM} -rf ${PREFIX}/${PKGNAMEPREFIX:S/-$//}
.endif

.include <bsd.port.mk>
