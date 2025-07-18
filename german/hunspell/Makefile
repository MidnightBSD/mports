PORTNAME=	hunspell
PORTVERSION=	20161207
PORTREVISION=	3
CATEGORIES=	german textproc
MASTER_SITES=	https://www.j3e.de/ispell/igerman98/dict/ \
		LOCAL/sunpoet/${PORTNAME}
DISTNAME=	igerman98-${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	German hunspell dictionaries
WWW=		https://www.j3e.de/ispell/igerman98/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

BROKEN_armv6=	fails to install: hunspell-capmain-plus_de_DE.tmp: Error 1
BROKEN_armv7=	fails to install: hunspell-capmain-plus_de_DE.tmp: Error 1

BUILD_DEPENDS=	aspell:textproc/aspell \
		gsed:textproc/gsed \
		hunspell:textproc/hunspell

USES=		gmake perl5 shebangfix tar:bzip2
USE_PERL5=	build

ALL_TARGET=	hunspell-all
NO_ARCH=	yes
SHEBANG_FILES=	bin/*.pl \
		bin/conv_dict_de_CH
SHEBANG_LANG=	sed
sed_OLD_CMD=	/bin/sed
sed_CMD=	${LOCALBASE}/bin/gsed

BINARY_ALIAS=	sed=${LOCALBASE}/bin/gsed

PLIST_FILES=	${DATADIR}/de_AT.aff \
		${DATADIR}/de_AT.dic \
		${DATADIR}/de_CH.aff \
		${DATADIR}/de_CH.dic \
		${DATADIR}/de_DE.aff \
		${DATADIR}/de_DE.dic

CHALIASES=	de_LI
DEALIASES=	de_BE de_LU
.for ALIAS in ${CHALIASES} ${DEALIASES}
PLIST_FILES+=	${DATADIR}/${ALIAS}.aff \
		${DATADIR}/${ALIAS}.dic
.endfor

post-patch:
	@${REINPLACE_CMD} -e "s/AFFIX_EXPANDER = ispell/AFFIX_EXPANDER = aspell/g" \
		${WRKSRC}/Makefile

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/hunspell/de_AT.aff ${WRKSRC}/hunspell/de_AT.dic \
		${WRKSRC}/hunspell/de_CH.aff ${WRKSRC}/hunspell/de_CH.dic \
		${WRKSRC}/hunspell/de_DE.aff ${WRKSRC}/hunspell/de_DE.dic ${STAGEDIR}${DATADIR}/
.for ALIAS in ${CHALIASES}
	${LN} -s de_CH.aff ${STAGEDIR}${DATADIR}/${ALIAS}.aff
	${LN} -s de_CH.dic ${STAGEDIR}${DATADIR}/${ALIAS}.dic
.endfor
.for ALIAS in ${DEALIASES}
	${LN} -s de_DE.aff ${STAGEDIR}${DATADIR}/${ALIAS}.aff
	${LN} -s de_DE.dic ${STAGEDIR}${DATADIR}/${ALIAS}.dic
.endfor

.include <bsd.port.mk>
