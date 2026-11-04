

PORTNAME=	aop
PORTVERSION=	0.6
CATEGORIES=	games
MASTER_SITES=	SF/nemysisfreebsdp/${CATEGORIES}/${PORTNAME}/
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}.png
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ncurses based arcade game with only 64 lines of code

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

ALL_TARGET=	#empty

PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${FAKE_DESTDIR}${TRUE_PREFIX}|g' \
		${WRKSRC}/Makefile

post-install:
	${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} ${_DISTDIR}/${PORTNAME}.png \
		${PREFIX}/share/pixmaps/
	${INSTALL_DATA} ${FILESDIR}/${PORTNAME}.desktop ${DESKTOPDIR}

	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
