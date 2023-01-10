PORTNAME=	gmines
PORTVERSION=	0.2
PORTREVISION=	2
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	GMines-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Well-known minesweeper game for GNUstep
WWW=		https://gap.nongnu.org/gmines/

LICENSE=	gpl2+

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GMines.app/GMines

.include <bsd.port.mk>
