# $MidnightBSD$

PORTNAME=	ladder
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
PKGNAMEPREFIX=	gnustep-
DISTNAME=	Ladder-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Go frontend for GNUstep

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING.GPL

RUN_DEPENDS=	gnugo:${PORTSDIR}/games/gnugo

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${DISTNAME}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/GNUstep/System/Applications/Ladder.app/Ladder


.include <bsd.port.mk>
