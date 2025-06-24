PORTNAME=	kaname12
PORTVERSION=	1.1
PORTREVISION=	3
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	FREEBSD_LOCAL/hrs
PKGNAMEPREFIX=	ja-font-
DISTNAME=	kaname_k12_bdf
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		knm_new_linux${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	12-dot Kanji font

LICENSE=	publicdom

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf

USES=		fonts
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
NO_WRKSUBDIR=	yes
SUB_FILES=	Makefile
MAKEFILE=	${WRKDIR}/Makefile
PORTDOCS=	readme readme.kaname_bdf kaname.doc \
		readme.knm gijutsu-siryou.doc

OPTIONS_DEFINE=	DOCS

post-install:
	${INSTALL_DATA} ${FILESDIR}/fonts.alias ${STAGEDIR}${FONTSDIR}

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/doc/kaname12/readme
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} install-doc

.include <bsd.port.mk>
