PORTNAME=	koruri
PORTVERSION=	20210720
CATEGORIES=	japanese x11-fonts
PKGNAMEPREFIX=	ja-font-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Koruri Japanese TrueType fonts
WWW=		https://koruri.github.io/

LICENSE=	Apache-2.0

USES=		fonts:fc
FONTNAME=	TTF
USE_GITHUB=	yes
GH_ACCOUNT=	Koruri
GH_PROJECT=	Koruri
NO_BUILD=	yes
NO_ARCH=	yes
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-install
SUB_FILES=	pkg-install
DATADIR=	${PREFIX}/share/font-${PORTNAME}
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${DATADIR}
	${MKDIR} ${FONTSDIR}
	cd ${FONTSDIR} && ${LN} -s -f \
	    ../../../${DATADIR_REL}/*.ttf .
	${MKDIR} ${PREFIX}/etc/fonts/conf.avail \
	    ${PREFIX}/etc/fonts/conf.d
	${INSTALL_DATA} ${FILESDIR}/20-unhint-${PORTNAME}.conf \
	    ${FILESDIR}/62-fonts-${PORTNAME}.conf \
	    ${PREFIX}/etc/fonts/conf.avail
	${LN} -s -f ../conf.avail/20-unhint-${PORTNAME}.conf \
	    ${PREFIX}/etc/fonts/conf.d/20-unhint-${PORTNAME}.conf
	${LN} -s -f ../conf.avail/62-fonts-${PORTNAME}.conf \
	    ${PREFIX}/etc/fonts/conf.d/62-fonts-${PORTNAME}.conf

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
