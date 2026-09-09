PORTNAME=	gnome-games
PORTVERSION=	47
CATEGORIES=	games gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Curated GNOME games meta port

LICENSE=	agg

USES=		metaport

RUN_DEPENDS=	five-or-more:games/five-or-more \
		atomix:games/atomix \
		gnome-2048:games/gnome-2048 \
		gnome-chess:games/gnome-chess \
		gnome-mahjongg:games/gnome-mahjongg \
		gnome-mines:games/gnome-mines \
		gnome-nibbles:games/gnome-nibbles \
		gnome-robots:games/gnome-robots \
		gnome-sudoku:games/gnome-sudoku \
		lightsoff:games/lightsoff \
		swell-foop:games/swell-foop

.if ${ARCH:Uunknown} == amd64
RUN_DEPENDS+=	aisleriot>=0:games/aisleriot
.endif

.include <bsd.port.mk>
