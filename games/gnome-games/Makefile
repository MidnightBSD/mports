PORTNAME=	gnome-games
PORTVERSION=	3.24.0
PORTREVISION=	1
CATEGORIES=	games gnome
MASTER_SITES=   # empty
DISTFILES=      # empty
EXTRACT_ONLY=   # empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome games meta port

LICENSE=	agg

NO_BUILD=	yes
NO_MTREE=       yes

RUN_DEPENDS=	five-or-more:games/five-or-more \
		atomix:games/atomix \
		four-in-a-row:games/four-in-a-row \
		gnome-2048:games/gnome-2048 \
		gnome-chess:games/gnome-chess \
		gnome-klotski:games/gnome-klotski \
		gnome-mahjongg:games/gnome-mahjongg \
		gnome-mines:games/gnome-mines \
		gnome-nibbles:games/gnome-nibbles \
		gnome-robots:games/gnome-robots \
		gnome-sudoku:games/gnome-sudoku \
		gnome-tetravex:games/gnome-tetravex \
		hitori:games/hitori \
		lightsoff:games/lightsoff \
		quadrapassel:games/quadrapassel \
		aisleriot>=0:games/aisleriot \
		swell-foop:games/swell-foop \
		tali:games/tali

do-install:
	${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
