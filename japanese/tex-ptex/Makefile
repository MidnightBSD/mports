PORTNAME=	ptex
DISTVERSION=	3.6
CATEGORIES=	japanese print
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/:source \
		LOCAL/tex:texmf
PKGNAMEPREFIX=	ja-tex-
DISTFILES=	texlive-${TEXLIVE_VERSION}-source${EXTRACT_SUFX}:source \
		texlive-${TEXLIVE_VERSION}-texmf-japanese_tex-ptex-freebsd${EXTRACT_SUFX}:texmf
DIST_SUBDIR=	TeX
EXTRACT_ONLY=	texlive-${TEXLIVE_VERSION}-source${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASCII Japanese pTeX
WWW=		https://ctan.org/pkg/ptex

USES=			localbase perl5 pkgconfig tar:xz tex
USE_TEX=		fmtutil formats kpathsea ptexenc web2c

GNU_CONFIGURE=		yes
CONFIGURE_ARGS=		${EXCLUDE_ENGINES:S/^/--disable-/} \
			--enable-ptex \
			--enable-euptex \
			--enable-ptex \
			--enable-uptex \
			--with-system-zlib \
			--without-x
.for L in kpathsea ptexenc
CONFIGURE_ARGS+=	--with-$L-include=${LOCALBASE}/include \
			--with-$L-libdir=${LOCALBASE}/lib \
			--with-system-$L
.endfor

MAKE_JOBS_UNSAFE=	yes
EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S,^,${_DISTNAME_SOURCE}/,}
EXTRACT_FILES=		build-aux libs/xpdf texk/web2c
WRKSRC=			${WRKDIR}/${_DISTNAME_SOURCE}/texk/web2c
EXCLUDE_ENGINES=	aleph etex hitex pdftex luatex luajittex mf mf-nowin \
			otangle mp pmp upmp web2c web-progs xetex tex \
			synctex mflua mfluajit luahbtex luajithbtex

_DISTNAME_SOURCE=	texlive-${TEXLIVE_VERSION}-source
TEXHASHDIRS=		${TEXMFDISTDIR} ${TEXMFVARDIR}
TEX_FORMATS=		ptex uptex

pre-configure:
	cd ${WRKDIR}/${_DISTNAME_SOURCE}/libs/xpdf && \
		${SETENV} ${CONFIGURE_ENV} ${SH} ${CONFIGURE_SCRIPT} \
		${CONFIGURE_ARGS}; \

pre-install:
	${TAR} -Jxf ${DISTDIR}/${DIST_SUBDIR}/texlive-${TEXLIVE_VERSION}-texmf-japanese_tex-ptex-freebsd${EXTRACT_SUFX} \
		-C ${STAGEDIR}${PREFIX}/share \
		--strip-components 1 --no-same-permission --no-same-owner

post-install:
	${FIND} -s ${STAGEDIR}${PREFIX}/share -not -type d | ${SORT} | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/##; /man1/s/\.1/\.1\.gz/' >> ${TMPPLIST}
	${FIND} -s ${STAGEDIR}${PREFIX}/share -type d -empty | ${SORT} -r | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/#@dir #' >> ${TMPPLIST}

.if defined(MAINTAINER_MODE)
_MAINTAINER_DISTNAME=	${DISTNAME_TEXMF}${EXTRACT_SUFX}
_EXTRACT_TARGETDIR=	texlive-${TEXLIVE_VERSION}-texmf-japanese_tex-ptex-freebsd
EXTRACT_FILES_TEXMF=	doc/ptex doc/platex doc/uptex doc/uplatex \
			doc/fonts/japanese-otf fonts/vf/public/japanese-otf \
			fonts/tfm/public/japanese-otf source/uplatex tex/ptex \
			source/platex \
			tex/uplatex source/fonts/japanese-otf tex/uptex \
			tex/platex tex/generic/hyph-utf8/patterns/ptex \
			fonts/map/dvipdfmx/updmap/kanjix.map

_maintainer-extract:
	${MAKE} clean
	${MKDIR} ${WRKDIR}/${_EXTRACT_TARGETDIR}
	${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/texlive-${TEXLIVE_VERSION}-texmf${EXTRACT_SUFX} \
		-C ${WRKDIR}/${_EXTRACT_TARGETDIR} \
		--strip-components 1 --no-same-permission --no-same-owner \
		${EXTRACT_FILES_TEXMF:S,^,${DISTNAME_TEXMF}/texmf-dist/,}
	@${FIND} ${WRKDIR} -name '*.orig' -delete

_maintainer-patch: _maintainer-extract
	${FIND} ${WRKDIR} -type f | \
		${XARGS} ${REINPLACE_CMD} -i '' -e 's|/usr/bin/perl|${PERL}|g'

.endif

.include <bsd.port.mk>
