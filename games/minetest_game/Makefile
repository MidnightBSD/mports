PORTNAME=	minetest_game
PORTVERSION=	5.4.1
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The main game for the Minetest game engine

LICENSE=	lgpl2.1 CC-BY-SA-3.0
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	minetest:games/minetest

USE_GITHUB=	yes
GH_ACCOUNT=	minetest

NO_BUILD=	yes
NO_ARCH=	yes
DATADIR=	${TRUE_PREFIX}/share/minetest/games/${PORTNAME}
PORTDATA=	*
PORTDOCS=	README.md game_api.txt schematic_tables.txt settingtypes.txt
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	cd ${WRKSRC} && ${COPYTREE_SHARE} "game.conf menu mods" ${FAKE_DESTDIR}${DATADIR}/

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/minetest.conf.example ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
