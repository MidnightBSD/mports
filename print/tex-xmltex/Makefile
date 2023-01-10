PORTNAME=	xmltex
PORTVERSION=	1.9
PORTREVISION=	3
CATEGORIES=	print
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-${TEXLIVE_VERSION}-texmf
DIST_SUBDIR=	TeX
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-validating XML parser, written in TeX

LICENSE=	unknown

USES=		tar:xz tex
USE_TEX=	texmf pdftex fmtutil
TEXHASHDIRS=	${TEXMFDISTDIR}
EXTRACT_AFTER_ARGS=| ${TAR} -xf - -C ${FAKE_DESTDIR}${TRUE_PREFIX}/share \
		--strip-components 1 --no-same-permission --no-same-owner \
		${EXTRACT_FILES:S,^,${DISTNAME}/,}
EXTRACT_FILES= \
	texmf-dist/tex/xmltex \
	texmf-dist/doc/otherformats/xmltex
NO_WRKSRC=	yes
NO_ARCH=	yes
NO_BUILD=	yes
TEX_FORMATS=	xmltex

.include <bsd.mport.options.mk>

.if ${ARCH} == "i386"
DISABLE_SIZE=	yes
.endif

do-install:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share
	${CAT} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} \
	    ${EXTRACT_AFTER_ARGS}

post-fake:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${FAKE_DESTDIR}${TRUE_PREFIX}/share/texmf-var/web2c/pdftex/xmltex.log \
		${FAKE_DESTDIR}${TRUE_PREFIX}/share/texmf-var/web2c/pdftex/pdfxmltex.log \

.include <bsd.port.mk>
