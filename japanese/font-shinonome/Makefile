PORTNAME=	shinonome
PORTVERSION=	0.9.11.p1
PORTREVISION=	7
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	http://openlab.jp/efont/dist/shinonome/%SUBDIR%/
MASTER_SITE_SUBDIR=	. old
PKGNAMEPREFIX=	ja-font-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.p/p/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shinonome Japanese fonts, 12/14/16 dots
WWW=		http://openlab.jp/efont/shinonome/

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf

USES=		fonts tar:bzip2
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
SUB_FILES=	Makefile
SUB_LIST=	BDFTOPCF="${LOCALBASE}/bin/bdftopcf" \
		GZIP_CMD="${GZIP_CMD}" \
		FONTSDIR="${FONTSDIR}" \
		STAGEDIR="${FAKE_DESTDIR}" \
		INSTALL_DATA="${INSTALL_DATA}"
MAKEFILE=	${WRKDIR}/Makefile
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/.p.*$//}

PORTDOCS=	AUTHORS BUGS ChangeLog ChangeLog.0 DESIGN.12 DESIGN.14	\
		DESIGN.16 DESIGN.18 INSTALL README THANKS TODO
OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
