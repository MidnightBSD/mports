# $MidnightBSD: mports/devel/binutils/Makefile,v 1.4 2011/12/20 03:57:30 laffer1 Exp $

PORTNAME=	binutils
PORTVERSION=	2.23.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEWARE}
MASTER_SITE_SUBDIR=	binutils/releases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU binary tools
LICENSE=	gpl3

USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

BUILD_DEPENDS=	${LOCALBASE}/lib/libgmp.so:${PORTSDIR}/math/gmp \
		${LOCALBASE}/lib/libmpfr.so:${PORTSDIR}/math/mpfr

CONFLICTS=	libbfd-[0-9]*

OPTIONS_DEFINE=       NLS

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-system-zlib \
			--with-sysroot=/ \
			--disable-werror \
			--with-gmp=${LOCALBASE} \
			--with-mpfr=${LOCALBASE}

MAN1=		addr2line.1 \
		ar.1 \
		as.1 \
		c++filt.1 \
		gprof.1 \
		dlltool.1 \
		elfedit.1 \
		ld.1 \
		nlmconv.1 \
		nm.1 \
		objcopy.1 \
		objdump.1 \
		ranlib.1 \
		readelf.1 \
		size.1 \
		strings.1 \
		strip.1 \
		windmc.1 \
		windres.1

INFO=		as \
		binutils \
		standards \
		gprof \
		bfd \
		configure \
		ld

.include <bsd.mport.options.mk>

# Actual earliest version may differ slightly
.if ${OSVERSION} >= 4016
CONFIGURE_ARGS+=	--enable-gold --enable-plugins
PLIST_SUB+=	GOLD=""
.else
PLIST_SUB+=	GOLD="@comment "
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ${ARCH} == "amd64"
ARCH=		x86_64
CONFIGURE_ARGS+=--build=${ARCH}-portbld-freebsd9.1
.endif

post-install:
.if ${OSVERSION} >= 4016
	${INSTALL_DATA} ${WRKSRC}/include/plugin-api.h ${PREFIX}/include/
.endif
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} ! -type d | \
		${SED} -e 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} -type d | \
		${SED} -e 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}

.include <bsd.port.mk>
