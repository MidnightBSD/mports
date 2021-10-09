# Created by: gurkan@phys.ethz.ch


PORTNAME=	lapispuzzle
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	LapisPuzzle-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tetris-like game for GNUstep

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/LapisPuzzle-${PORTVERSION}

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/LapisPuzzle.app/LapisPuzzle

.include <bsd.port.mk>
