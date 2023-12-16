PORTNAME=	xtruco
PORTVERSION=	1.0
CATEGORIES=	games
MASTER_SITES=	XCONTRIB/games
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple version for X Window of the famous card game Super Truco

LICENSE=	gpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg
USE_XORG=	x11
PLIST_FILES=	bin/xtruco

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xtruco ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
