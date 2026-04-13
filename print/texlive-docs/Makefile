PORTNAME=	texlive
PORTVERSION=	${TEXLIVE_VERSION}
CATEGORIES=	print
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/
PKGNAMESUFFIX=	-docs
DISTNAME=	${PORTNAME}-${PORTVERSION}-texmf
DIST_SUBDIR=	TeX

MAINTAINER=	tex@FreeBSD.org
COMMENT=	TeX Live Typesetting System, documentation
WWW=		https://tug.org/texlive/

USES=		perl5 tar:xz tex

EXTRACT_AFTER_ARGS=	| ${TAR} xf - \
			${EXCLUDE_FILES:S,^,--exclude ${DISTNAME}/,}
NO_BUILD=	yes

EXCLUDE_FILES=	\*/doc/man texmf-dist/doc/aleph texmf-dist/doc/lualatex \
		texmf-dist/doc/luatex texmf-dist/doc/xelatex \
		texmf-dist/doc/xetex texmf-dist/doc/otherformats/jadetex \
		texmf-dist/doc/otherformats/xmltex texmf-dist/doc/ptex \
		texmf-dist/doc/platex texmf-dist/doc/uptex \
		texmf-dist/doc/uplatex texmf-dist/doc/fonts/japanese-otf \
		texmf-dist/doc/fonts/japanese-otf-uptex \
		texmf-dist/doc/fonts/jfontmaps texmf-dist/doc/dvips \
		texmf-dist/doc/dvipdfmx

NO_ARCH=	yes

.include <bsd.mport.options.mk>

.if ${ARCH} == "i386"
DISABLE_SIZE=   yes
.endif

do-extract:
	@${MKDIR} ${WRKDIR}

do-install:
	${CAT} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} \
	    ${EXTRACT_AFTER_ARGS} -C ${PREFIX}/share \
	    --strip-components 1 --no-same-permission --no-same-owner \
	    ${DISTNAME}/texmf-dist/doc
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/fontforge|${TRUE_PREFIX}/bin/fontforge|g' \
		${PREFIX}/share/texmf-dist/doc/fonts/aesupp/genfonts.pe \
		${PREFIX}/share/texmf-dist/doc/fonts/berenisadf/ff-ybd.pe \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/report/kernclasses.py \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/utility/metafont/bulk_eps_import.py
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/perl -w|${PERL}|g' \
		${PREFIX}/share/texmf-dist/doc/fonts/aesupp/ggen.pl \
		${PREFIX}/share/texmf-dist/doc/latex/shipunov/scripts/abs2rel.pl \
		${PREFIX}/share/texmf-dist/doc/latex/shipunov/scripts/biokey2html1.pl \
		${PREFIX}/share/texmf-dist/doc/latex/shipunov/scripts/biokey2html2.pl \
		${PREFIX}/share/texmf-dist/doc/latex/shipunov/scripts/biokey2html3.pl \
		${PREFIX}/share/texmf-dist/doc/latex/shipunov/scripts/txt2qq.pl \
		${PREFIX}/share/texmf-dist/doc/latex/ucs/makeunidef.pl \
		${PREFIX}/share/texmf-dist/doc/support/ctan-o-mat/lib/md2ltx.pl
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/perl -T|${PERL}|g' \
		${PREFIX}/share/texmf-dist/doc/latex/ucs/discovermacro.pl \
		${PREFIX}/share/texmf-dist/doc/latex/ucs/latexout.pl
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/perl|${PERL}|g' \
		${PREFIX}/share/texmf-dist/doc/fonts/dad/dad-to-utf8.pl \
		${PREFIX}/share/texmf-dist/doc/fonts/dad/utf8-to-dad.pl \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/utility/KerningNumerals.pl \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/test/MES-Conformance/mes-list-expand.pl \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/test/MES-Conformance/CheckConformance.pl \
		${PREFIX}/share/texmf-dist/doc/fonts/phaistos/getglyphs \
		${PREFIX}/share/texmf-dist/doc/generic/pst-mirror/createEPS/scripts/filtre.pl \
		${PREFIX}/share/texmf-dist/doc/latex/gridslides/compile.pl \
		${PREFIX}/share/texmf-dist/doc/latex/latex-web-companion/ch7/sgmlspl.pl \
		${PREFIX}/share/texmf-dist/doc/latex/ucs/unsupported/u2ps \
		${PREFIX}/share/texmf-dist/doc/support/gustprog/porzadki.pl
	${REINPLACE_CMD} -i '' -E -e '1s|/usr/bin/env python[23]?|${python_CMD}|' \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/utility/hex_range.py \
		${PREFIX}/share/texmf-dist/doc/fonts/xcharter/altone.py \
		${PREFIX}/share/texmf-dist/doc/latex/aramaic-serto/serto.py \
		${PREFIX}/share/texmf-dist/doc/latex/scanpages/replicate.py \
		${PREFIX}/share/texmf-dist/doc/latex/songproj/song2tex.py
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/python|${PYTHO_CMD}|g' \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/test/ranges/Arabic/unicode_joining.py \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/test/ranges/Arabic/arabic_test.py \
		${PREFIX}/share/texmf-dist/doc/fonts/gnu-freefont/tools/test/ranges/Arabic/generate_arabic_shaping.py
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/texlua|${PREFIX}/bin/texlua|g' \
		${PREFIX}/share/texmf-dist/doc/generic/m-tx/buildmtxdoc.lua
	${REINPLACE_CMD} -i '' -e 's|/bin/bash|${TRUE_PREFIX}/bin/bash|g' \
		${PREFIX}/share/texmf-dist/doc/cstex/cspsfonts-gen/mkfc \
		${PREFIX}/share/texmf-dist/doc/cstex/cspsfonts-gen/mkf \
		${PREFIX}/share/texmf-dist/doc/fonts/drm/allfonts.sh \
		${PREFIX}/share/texmf-dist/doc/generic/e-french/bin/linux/makefrindex \
		${PREFIX}/share/texmf-dist/doc/latex/bardiag/example/compile.all \
		${PREFIX}/share/texmf-dist/doc/latex/beamerappendixnote/build.sh  \
		${PREFIX}/share/texmf-dist/doc/latex/biblatex-abnt/test.sh \
		${PREFIX}/share/texmf-dist/doc/latex/biblatex-software/mkbiblatexstubs.sh \
		${PREFIX}/share/texmf-dist/doc/latex/chinesechess/build.sh \
		${PREFIX}/share/texmf-dist/doc/latex/circledtext/build.sh \
		${PREFIX}/share/texmf-dist/doc/latex/codebox/build.sh \
		${PREFIX}/share/texmf-dist/doc/latex/ctable/inst \
		${PREFIX}/share/texmf-dist/doc/latex/gamebooklib/gamebooklib_countpagesperseed.sh \
		${PREFIX}/share/texmf-dist/doc/latex/hepnames/mkmacrotables \
		${PREFIX}/share/texmf-dist/doc/latex/hvfloat/runAll.sh \
		${PREFIX}/share/texmf-dist/doc/latex/hvfloat/runEXA.sh \
		${PREFIX}/share/texmf-dist/doc/latex/pascaltriangle/build.sh \
		${PREFIX}/share/texmf-dist/doc/latex/pdfreview/pdfreview.sh \
		${PREFIX}/share/texmf-dist/doc/latex/pdfreview/pdfshrink.sh \
		${PREFIX}/share/texmf-dist/doc/latex/seminar/run.sh \
		${PREFIX}/share/texmf-dist/doc/latex/shdoc/shreformat.sh \
		${PREFIX}/share/texmf-dist/doc/latex/shipunov/scripts/biokey2html.sh \
		${PREFIX}/share/texmf-dist/doc/latex/termsim/build.sh \
		${PREFIX}/share/texmf-dist/doc/latex/tlc-article/bin/deploy \
		${PREFIX}/share/texmf-dist/doc/latex/uspace/uspace-ctanify.sh \
		${PREFIX}/share/texmf-dist/doc/metapost/featpost/bash/COMPILE.sh \
		${PREFIX}/share/texmf-dist/doc/metapost/featpost/bash/laproof.sh \
		${PREFIX}/share/texmf-dist/doc/metapost/featpost/bash/makehtmlindex.sh \
		${PREFIX}/share/texmf-dist/doc/plain/transparent-io/TrIO.org \
		${PREFIX}/share/texmf-dist/doc/support/chklref/release.sh \
		${PREFIX}/share/texmf-dist/doc/support/latexdiff/contrib/latexdiff-wrap
	${REINPLACE_CMD} -i '' -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/share/texmf-dist/doc/generic/m-tx/buildmtxdoc.lua
	${FIND} ${PREFIX}/share/texmf-dist -iname '*.bak' -delete \
	${FIND} -s ${PREFIX}/share/texmf-dist -not -type d | ${SORT} | \
		${SED} -e 's#^${PREFIX}/##' >> ${TMPPLIST}
	${FIND} -s ${PREFIX}/share/texmf-dist -type d -empty | ${SORT} -r | \
		${SED} -e 's#^${PREFIX}/#@dir #' >> ${TMPPLIST}

.include <bsd.port.mk>
