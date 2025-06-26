PORTNAME=	kappa20
PORTVERSION=	0.396
PORTREVISION=	4
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	LOCAL/hrs
PKGNAMEPREFIX=	ja-font-
DISTNAME=	Kappa20-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	20-dot Kanji font Kappa20
WWW=		http://kappa.allnet.ne.jp/20dot.fonts/

LICENSE=	publicdom

BUILD_DEPENDS=	mkitalic:x11-fonts/mkbold-mkitalic \
		bdftopcf:x11-fonts/bdftopcf

USES=		fonts tar:bzip2
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
MAKE_ARGS=	FONTSDIR="${FONTSDIR:S,${PREFIX},,}"
MAKEFILE=	${WRKDIR}/Makefile
SUB_FILES=	Makefile
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

pre-build:
	cd ${WRKSRC} && ${SH} makebdf.sh

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
