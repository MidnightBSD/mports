

PORTNAME=	gmastermind
PORTVERSION=	0.6
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	GMastermind-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Well-known mastermind game

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GMastermind.app/GMastermind

.include <bsd.port.mk>
