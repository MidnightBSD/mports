PORTNAME=	cica
PORTVERSION=	5.0.3
PORTREVISION=	0
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	https://github.com/miiton/Cica/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	ja-font-
DISTNAME=	Cica_v${DISTVERSION}${OPT_EMOJI}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cica Japanese monospaced fonts for programming
WWW=		https://github.com/miiton/Cica

LICENSE=	OFL11

USES=		fonts:fc zip
FONTPATHSPEC=	${FONTNAME}:pri=60
NO_WRKSUBDIR=	yes
NO_ARCH=	yes
NO_BUILD=	yes
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-install
SUB_FILES=	pkg-install
WRKSRC=		${WRKDIR}/${DISTNAME}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS EMOJI
OPTIONS_DEFAULT=EMOJI
EMOJI_DESC=	With Emoji

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEMOJI}
OPT_EMOJI=
.else
OPT_EMOJI=	_without_emoji
.endif

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} *.ttf ${STAGEDIR}${FONTSDIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/fonts/conf.avail \
	    ${STAGEDIR}${PREFIX}/etc/fonts/conf.d
	${INSTALL_DATA} ${FILESDIR}/20-unhint-${FONTNAME}.conf \
	    ${FILESDIR}/62-fonts-${FONTNAME}.conf \
	    ${STAGEDIR}${PREFIX}/etc/fonts/conf.avail
	${LN} -s -f ../conf.avail/20-unhint-${FONTNAME}.conf \
	    ${STAGEDIR}${PREFIX}/etc/fonts/conf.d/20-unhint-${FONTNAME}.conf
	${LN} -s -f ../conf.avail/62-fonts-${FONTNAME}.conf \
	    ${STAGEDIR}${PREFIX}/etc/fonts/conf.d/62-fonts-${FONTNAME}.conf

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} \
		"! -name *\.ttf"

makesums:
	${MAKE} rmconfig
	${MAKE} makesum OPTIONS_UNSET=EMOJI
	${MV} distinfo .distinfo.without_emoji
	${MAKE} makesum OPTIONS_SET=EMOJI
	tail -2 .distinfo.without_emoji >> distinfo
	${RM} .distinfo.without_emoji

.include <bsd.port.mk>
