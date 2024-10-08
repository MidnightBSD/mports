PORTNAME=	dvipsk
PORTVERSION=	${TEXLIVE_YEAR}.1
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/:source \
		LOCAL/tex:texmf
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-${TEXLIVE_VERSION}-source
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:source \
		${PKGNAMEPREFIX}${PORTNAME}-${TEXLIVE_VERSION}-freebsd${EXTRACT_SUFX}:texmf
DIST_SUBDIR=	TeX
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert a TeX DVI file to PostScript

LICENSE=	gpl2

LIB_DEPENDS=	libpaper.so:print/libpaper

USES=		gmake localbase:ldflags pkgconfig tar:xz tex
USE_TEX=	kpathsea texhash web2c

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--with-kpathsea-includes=${LOCALBASE}/include \
		--with-kpathsea-libdir=${LOCALBASE}/lib \
		--with-paper \
		--with-system-kpathsea \
		--with-system-libpng \
		--with-system-zlib

EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S,^,${DISTNAME}/,}
EXTRACT_FILES=			am m4 build-aux texk/dvipsk texk/lcdf-typetools
WRKSRC=				${WRKDIR}/${DISTNAME}/texk/dvipsk

INFO=		dvips
PLIST_FILES=	bin/afm2tfm \
		bin/dvips \
		share/man/man1/afm2tfm.1.gz \
		share/man/man1/dvips.1.gz

.include <bsd.mport.options.mk>

.if ${ARCH} == "i386"
DISABLE_SIZE=   yes
.endif

pre-install:
	${TAR} -Jxf ${DISTDIR}/${DIST_SUBDIR}/${PKGNAMEPREFIX}${PORTNAME}-${TEXLIVE_VERSION}-freebsd${EXTRACT_SUFX} \
		-C ${STAGEDIR}${PREFIX}/share \
		--strip-components 1 --no-same-permission --no-same-owner

post-install:
	${FIND} -s ${STAGEDIR}${PREFIX}/share/texmf-dist -not -type d | ${SORT} | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/##' >> ${TMPPLIST}
	${FIND} -s ${STAGEDIR}${PREFIX}/share/texmf-dist -type d -empty | ${SORT} -r | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/#@dir #' >> ${TMPPLIST}

.include <bsd.port.mk>
