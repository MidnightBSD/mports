# $MidnightBSD: mports/graphics/png/Makefile,v 1.18 2010/03/25 00:56:56 laffer1 Exp $

PORTNAME=	png
PORTVERSION=	1.4.1
PORTREVISION=	0
CATEGORIES=	graphics
MASTER_SITES=	SF/lib${PORTNAME}/01-lib${PORTNAME}-master/${PORTVERSION}
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

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
USE_BZIP2=	yes

MAKE_ENV=	SHLIB_VER="${SHLIB_VER}"
PLIST_SUB=	SHLIB_VER="${SHLIB_VER}"

MAN3=		libpng.3 libpngpf.3
MAN5=		png.5
MANCOMPRESSED=	maybe

.include <bsd.port.pre.mk>

post-extract:
# Please don't delete the following line - this link used by ghostscript* ports
	@${LN} -sf ${WRKSRC} ${WRKDIR}/libpng

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
