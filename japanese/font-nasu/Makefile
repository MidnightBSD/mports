PORTNAME=	nasu
PORTVERSION=	20200227
PORTREVISION=	0
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	OSDN_CHAMBER/25/25473
PKGNAMEPREFIX=	ja-font-
DISTNAME=	NasuFont-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nasu Japanese TrueType fonts
WWW=		https://itouhiro.hatenablog.com/entry/20140917/font

LICENSE=	Apache-2.0

USES=		fonts:fc zip
FONTPATHSPEC=	${FONTNAME}:pri=60
NO_ARCH=	yes
NO_BUILD=	yes
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-install
SUB_FILES=	pkg-install
SUB_LIST=	PORTVERSION=${PORTVERSION}
PLIST_SUB=	PORTVERSION=${PORTVERSION}
WRKSRC=		${WRKDIR}/${DISTNAME:C/-//}
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
		"! -name *\.ttf"

.include <bsd.port.mk>
