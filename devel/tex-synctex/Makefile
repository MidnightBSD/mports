PORTNAME=	synctex
PORTVERSION=	2.0.0
CATEGORIES=	devel
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-${TEXLIVE_VERSION}-source
DIST_SUBDIR=	TeX

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronization TeXnology parser library
WWW=		http://itexmac.sourceforge.net/SyncTeX.html

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/synctexdir/README.txt

USES=		libtool localbase pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_TEX=	kpathsea

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	${EXCLUDE_ENGINES:S/^/--disable-/} \
		--with-system-kpathsea \
		--with-system-zlib \
		--without-gmp-includes \
		--without-gmp-libdir \
		--without-mf-x-toolkit \
		--without-mpfr-includes \
		--without-mpfr-libdir \
		--without-system-cairo \
		--without-system-freetype2 \
		--without-system-gmp \
		--without-system-graphite2 \
		--without-system-harfbuzz \
		--without-system-icu \
		--without-system-libpng \
		--without-system-mpfr \
		--without-system-pixman \
		--without-system-ptexenc \
		--without-system-teckit \
		--without-system-zziplib \
		--without-x

INSTALL_TARGET=	install-strip

EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S,^,${DISTNAME}/,}

WRKSRC=		${WRKDIR}/${DISTNAME}/texk/web2c

EXTRACT_FILES=		build-aux texk/web2c
EXCLUDE_ENGINES=	etex aleph luatex luajittex pdftex mf mf-nowin ptex \
			eptex uptex euptex xetex tex otangle mp pmp upmp web2c \
			web-progs luahbtex luajithbtex mflua mfluajit latex \
			pdftex

post-extract:
	@${FIND} ${WRKSRC} -name '*.orig' -delete

.include <bsd.port.mk>