# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/games/minetest_game/Makefile 392031 2015-07-14 15:58:52Z amdmi3 $

PORTNAME=	minetest_game
PORTVERSION=	0.4.12
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The main game for the Minetest game engine

LICENSE=	lgpl2.1

RUN_DEPENDS=	minetest:${PORTSDIR}/games/minetest

USE_GITHUB=	yes
GH_ACCOUNT=	minetest

WRKSRC=		${WRKDIR}/minetest_game-0.4.12

NO_BUILD=	yes
NO_ARCH=	yes
DATADIR=	${PREFIX}/share/minetest/games/${PORTNAME}
PORTDATA=	*
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} "game.conf menu mods" ${DATADIR}/
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.txt ${DOCSDIR}/

.include <bsd.port.mk>
