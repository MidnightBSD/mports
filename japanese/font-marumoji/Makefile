PORTNAME=	marumoji
PORTVERSION=	1.0
PORTREVISION=	11
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	LOCAL/hrs/${PORTNAME}
PKGNAMEPREFIX=	ja-font-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese marumoji fonts

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	mkbold:x11-fonts/mkbold-mkitalic \
		bdftopcf:x11-fonts/bdftopcf

USES=		fonts:fc
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
MAKE_ENV=	FONTSDIR=${FONTSDIR:S,${TRUE_PREFIX},,}
SUB_FILES=	Makefile pkg-install
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-install

${WRKSRC}/maru16.bdf:
	cd ${WRKSRC} && ${SED} -f m18to16.sed < maru18.bdf > maru16.bdf

pre-build: ${WRKSRC}/maru16.bdf
	${INSTALL_DATA} ${WRKDIR}/Makefile ${WRKSRC}

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/fonts/marumoji

.include <bsd.port.mk>
