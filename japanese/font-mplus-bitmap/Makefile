PORTNAME=	mplus
PORTVERSION=	2.2.4
PORTREVISION=	3
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	OSDN/${PORTNAME}-fonts
PKGNAMEPREFIX=	ja-font-
PKGNAMESUFFIX=	-bitmap
DISTNAME=	${PORTNAME}_bitmap_fonts-2.2.4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	M+ Bitmap fonts
WWW=		https://mplus-fonts.osdn.jp/mplus-bitmap-fonts/index.html

LICENSE=	publicdom

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf

USES=		fonts
FONTPATHSPEC=	${PORTNAME}${PKGNAMESUFFIX}:unscaled:pri=60
NO_BUILD=	yes
NO_ARCH=	yes
FONTSDIR=	${PREFIX}/share/fonts/${PORTNAME}${PKGNAMESUFFIX}
DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
PORTDOCS=	INSTALL_E LICENSE_E README_E \
		INSTALL_J LICENSE_J README_J

OPTIONS_DEFINE=	DOCS

post-extract:
	cd ${WRKSRC} && \
	    ${CAT} fonts_e/fonts.alias fonts_e/euro/fonts.alias \
	    fonts_j/fonts.alias | ${SORT} -r > ${WRKDIR}/fonts.alias

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC} && \
	    ${SETENV} DESTDIR="${STAGEDIR}${FONTSDIR}" \
	    ${SH} ${WRKSRC}/install_mplus_fonts
	${INSTALL_DATA} ${WRKDIR}/fonts.alias ${STAGEDIR}${FONTSDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
