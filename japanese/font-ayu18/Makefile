PORTNAME=	ayu18
PORTVERSION=	1.3.1.1
PORTREVISION=	3
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	OSDN/x-tt
PKGNAMEPREFIX=	ja-font-
DISTFILES=	ayu18gothic-1.3a${EXTRACT_SUFX} \
		ayu18mincho-1.1${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ayu 18-dot Kanji font
WWW=		https://x-tt.osdn.jp/ayu.html

LICENSE=	publicdom

BUILD_DEPENDS=	mkitalic:x11-fonts/mkbold-mkitalic \
		bdftopcf:x11-fonts/bdftopcf

USES=		fonts
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
NO_WRKSUBDIR=	yes
SUB_FILES=	Makefile
MAKEFILE=	${WRKDIR}/Makefile
PORTDOCS=	README.txt

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
