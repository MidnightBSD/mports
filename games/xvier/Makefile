PORTNAME=	xvier
PORTVERSION=	1.0
CATEGORIES=	games
MASTER_SITES=	SUNSITE/games/strategy \
		SF/nemysisfreebsdp/${CATEGORIES}/:icons
DISTFILES=	${PORTNAME}${EXTRACT_SUFX} \
		${PORTNAME}.png:icons
EXTRACT_ONLY=	${PORTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Throw stones into free columns

LICENSE=	other
LICENSE_FILE=	${WRKSRC}/README

USES=		imake tar:Z xorg
USE_XORG=	x11 xext
USE_CSTD=	gnu89

PORTDOCS=	README
OPTIONS_DEFINE=	DOCS

PLIST_FILES=	bin/${PORTNAME} \
		libexec/${PORTNAME}_prog \
		share/man/man6/xvier.6.gz \
		share/pixmaps/xvier.png

DESKTOP_ENTRIES="Xvier" "" "${PORTNAME}" \
		"${PORTNAME}" "Game;ArcadeGame;" ""

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME}_prog \
		${PREFIX}/libexec/
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.man \
		${PREFIX}/share/man/man6/${PORTNAME}.6

	${INSTALL_DATA} ${_DISTDIR}/${PORTNAME}.png \
		${PREFIX}/share/pixmaps/

	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
