# $MidnightBSD: mports/graphics/png/Makefile,v 1.22 2011/06/05 05:27:30 laffer1 Exp $

PORTNAME=	png
PORTVERSION=	1.4.7
CATEGORIES=	graphics
MASTER_SITES=	SF/lib${PORTNAME}/lib${PORTNAME}14/${PORTVERSION}
DISTNAME=	lib${PORTNAME}-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

FAKE_OPTS=	trueprefix

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating PNG images
LICENSE=	other

MAKEFILE=	${WRKSRC}/scripts/makefile.freebsd
ALL_TARGET=	all libpng-config test
MAKE_FLAGS=	ccopts="${CFLAGS}" ldopts="${LDFLAGS}" -f
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes
SHLIB_VER=	6
USE_XZ=		yes

MAKE_ENV=	SHLIB_VER="${SHLIB_VER}"
PLIST_SUB=	SHLIB_VER="${SHLIB_VER}"

MAN3=		libpng.3 libpngpf.3
MAN5=		png.5
MANCOMPRESSED=	maybe

.include <bsd.port.pre.mk>

#.if defined(WITH_APNG) || make(makesum) || defined(FETCH_ALL)
MASTER_SITES+=	SF/apng/libpng/libpng14/:apng \
		http://littlesvr.ca/apng/diff/:apng
DISTFILES+=	${DISTNAME}-apng.patch.gz:apng
EXTRACT_ONLY=   ${DISTNAME}${EXTRACT_SUFX}
#.endif
.if defined(WITH_APNG)
USE_DOS2UNIX=	${DISTNAME}-apng.patch
EXTRA_PATCHES=	${WRKSRC}/${DISTNAME}-apng.patch
.endif

post-extract:
# Please don't delete the following line - this link used by ghostscript* ports
	@${LN} -sf ${WRKSRC} ${WRKDIR}/libpng
.if defined(WITH_APNG)
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}-apng.patch.gz ${WRKSRC}
	gunzip ${WRKSRC}/${DISTNAME}-apng.patch.gz
.endif

pre-install:
	@${MKDIR} ${PREFIX}/include/libpng
	@${MKDIR} ${PREFIX}/libdata/pkgconfig

post-install:
	${SED} -e 's|@PREFIX@|${TRUE_PREFIX}|' ${WRKSRC}/scripts/libpng.pc.in \
		> ${WRKSRC}/scripts/libpng.pc
	${INSTALL_DATA} ${WRKSRC}/scripts/libpng.pc \
		${PREFIX}/libdata/pkgconfig/libpng14.pc
	${LN} -sf libpng14.pc ${PREFIX}/libdata/pkgconfig/libpng.pc

.include <bsd.port.post.mk>
