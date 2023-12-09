PORTNAME=	xtron
PORTVERSION=	1.1a
PORTREVISION=	3
CATEGORIES=	games
MASTER_SITES=	SUNSITE/games/arcade

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Avoid running into walls, your own tail, and that of your opponent

LICENSE=	gpl+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg tar:tgz
USE_XORG=	x11 xpm

PLIST_FILES=	bin/${PORTNAME} lib/X11/app-defaults/Tron
PORTDOCS=	*
PORTDATA=	*

DESKTOP_ENTRIES="xtron" \
		"Avoid running into walls, your own tail, and that of your opponent" \
		"${DATADIR}/Xtron_icon.xpm" \
		"${PORTNAME}" \
		"Game;ArcadeGame;" \
		false

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/xtronrc

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/pixmaps/* ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/xtronrc ${PREFIX}/lib/X11/app-defaults/Tron

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/CHANGES ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
