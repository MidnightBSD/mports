PORTNAME=	aozoramincho
PORTVERSION=	0.1
PORTREVISION=	2
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	https://web.archive.org/web/20200321102301/http://blueskis.wktk.so/AozoraMincho/archive/v${PORTVERSION}/
PKGNAMEPREFIX=	ja-font-
DISTNAME=	${PORTNAME}-readme-ttf
DIST_SUBDIR=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aozora Mincho Japanese TrueType fonts
WWW=		http://blueskis.wktk.so/AozoraMincho/index.html

LICENSE=	other

USES=		fonts:fc zip
FONTPATHSPEC=	${FONTNAME}:pri=60
NO_ARCH=	yes
NO_BUILD=	yes
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-install
SUB_FILES=	pkg-install
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

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
		"! ( -name *\.ttf -o -name IPA_PMincho )"

.include <bsd.port.mk>
