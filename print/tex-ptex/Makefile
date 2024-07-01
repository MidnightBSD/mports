PORTNAME=	ptex
PORTVERSION=	3.6
PORTREVISION=	4
CATEGORIES=	print japanese
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/:source \
		FREEBSD_LOCAL/tex:texmf
PKGNAMEPREFIX=	ja-tex-
DISTFILES=	texlive-${TEXLIVE_VERSION}-source${EXTRACT_SUFX}:source \
		texlive-${TEXLIVE_VERSION}-texmf-japanese_tex-ptex-freebsd${EXTRACT_SUFX}:texmf
DIST_SUBDIR=	TeX
EXTRACT_ONLY=	texlive-${TEXLIVE_VERSION}-source${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASCII Japanese pTeX
WWW=		https://ctan.org/pkg/ptex

USES=				localbase perl5 pkgconfig tar:xz tex
USE_TEX=			fmtutil formats kpathsea ptexenc web2c

GNU_CONFIGURE=			yes
CONFIGURE_ARGS=		${EXCLUDE_ENGINES:S/^/--disable-/} \
			--enable-eptex \
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
EXTRACT_FILES=			build-aux libs/xpdf texk/web2c
WRKSRC=				${WRKDIR}/${_DISTNAME_SOURCE}/texk/web2c
EXCLUDE_ENGINES=		aleph etex pdftex luatex luajittex mf mf-nowin \
				otangle mp pmp upmp web2c web-progs xetex tex \
				synctex mflua mfluajit luahbtex luajithbtex

_DISTNAME_SOURCE=	texlive-${TEXLIVE_VERSION}-source
TEXHASHDIRS=			${TEXMFDISTDIR} ${TEXMFVARDIR}
TEX_FORMATS=		ptex uptex

#post-extract:
#	@${FIND} ${WRKSRC} -name '*.orig' -delete

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
		${SED} -e 's#^${STAGEDIR}${PREFIX}/##' >> ${TMPPLIST}
	${FIND} -s ${STAGEDIR}${PREFIX}/share -type d -empty | ${SORT} -r | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/#@dir #' >> ${TMPPLIST}

.include <bsd.port.mk>
