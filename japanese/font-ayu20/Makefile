PORTNAME=	ayu20
PORTVERSION=	1.7.a
PORTREVISION=	0
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	OSDN/x-tt
PKGNAMEPREFIX=	ja-font-
DISTNAME=	ayu20gothic-1.7a

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ayu 20-dot Kanji font
WWW=		https://x-tt.osdn.jp/ayu.html

LICENSE=	publicdom

BUILD_DEPENDS=	mkitalic:x11-fonts/mkbold-mkitalic \
		bdftopcf:x11-fonts/bdftopcf

USES=		fonts
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
NO_WRKSUBDIR=	yes
SUB_FILES=	Makefile
PORTDOCS=	README.txt
MAKEFILE=	${WRKDIR}/Makefile

OPTIONS_DEFINE=	DOCS

post-install:
	${INSTALL_DATA} ${FILESDIR}/fonts.alias \
	    ${STAGEDIR}${FONTSDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
