# Created by: Satoshi TAOKA <taoka@FreeBSD.org>

PORTNAME=	intlfonts
PORTVERSION=	1.4.2
CATEGORIES=	x11-fonts
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free X11 fonts for all characters that Emacs can handle

LICENSE=	other

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf

USES=		fonts

NO_ARCH=	yes

# Don't move to pkg-plist, must appear before @fcfontsdir from USES=fonts.
PLIST_FILES=	"@fontsdir ${FONTSDIR}/TrueType" \
		"@fontsdir ${FONTSDIR}/Type1"

OPTIONS_DEFINE=	DOCS

FONTS=		Asian Chinese Chinese.X Ethiopic European European.BIG Japanese Japanese.BIG Japanese.X Misc
FONTS_ALIAS=	Asian Chinese European Japanese Japanese.X

do-build:
.for f in ${FONTS}
	for bdf in ${WRKSRC}/${f}/*.bdf; do ${LOCALBASE}/bin/bdftopcf $${bdf} | ${GZIP_CMD} > $${bdf%.bdf}.pcf.gz; done
.endfor

do-install:
	@${MKDIR} ${FONTSDIR}/TrueType ${FONTSDIR}/Type1
.for f in ${FONTS}
	${INSTALL_DATA} ${WRKSRC}/${f}/*.pcf.gz ${FONTSDIR}
.endfor
.for f in ${FONTS_ALIAS}
	${CAT} ${WRKSRC}/${f}/fonts.alias >> ${FONTSDIR}/fonts.alias
.endfor
	${INSTALL_DATA} ${WRKSRC}/TrueType/*.* ${FONTSDIR}/TrueType
	${INSTALL_DATA} ${WRKSRC}/Type1/*.* ${FONTSDIR}/Type1
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${WRKSRC}/Emacs.ap ${WRKSRC}/NEWS \
		${DOCSDIR}

.include <bsd.port.mk>
