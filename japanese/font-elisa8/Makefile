PORTNAME=	elisa8
PORTVERSION=	1.0
PORTREVISION=	4
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	LOCAL/hrs
PKGNAMEPREFIX=	ja-font-
DISTNAME=	elisat10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	8-dot Kanji font 'elisa'
WWW=		http://hp.vector.co.jp/authors/VA002310/family.htm

LICENSE=	NOTPARTIAL-NOTCOMMERCIAL
LICENSE_NAME=	Whole, not partial, and not commercial
LICENSE_TEXT=	Free redistribution of the whole package allowed, \
		not partial, and not commercial
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf

USES=		fonts
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
NO_WRKSUBDIR=	yes
SUB_FILES=	Makefile
MAKEFILE=	${WRKDIR}/Makefile
SUB_LIST=	BDFTOPCF_CMD="${LOCALBASE}/bin/bdftopcf" \
		GZIP_CMD="${GZIP_CMD}"
PORTDOCS=	elisa100.doc elisat10.doc elisat10.html

OPTIONS_DEFINE=	DOCS

post-install:
	${INSTALL_DATA} ${FILESDIR}/fonts.alias ${STAGEDIR}${FONTSDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
