PORTNAME=	xtriangles
PORTVERSION=	5.5.2
CATEGORIES=	games
MASTER_SITES=	XCONTRIB/games/xpuzzles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Triangles puzzle
WWW=		http://www.tux.org/~bagleyd/puzzles.html

WRKSRC=		${WRKDIR}/${PORTNAME}
USES=		imake xorg
USE_XORG=	x11 xext xt sm ice

PLIST_FILES=	bin/xtriangles \
		lib/X11/app-defaults/Triangles \
		share/man/man1/xtriangles.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xtriangles ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/Triangles.ad \
		 ${STAGEDIR}${PREFIX}/lib/X11/app-defaults/Triangles
	${INSTALL_MAN} ${WRKSRC}/xtriangles.man ${STAGEDIR}${PREFIX}/share/man/man1/xtriangles.1

.include <bsd.port.mk>
