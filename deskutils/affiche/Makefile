PORTNAME=	affiche
PORTVERSION=	0.6.0
PORTREVISION=	6
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://www.collaboration-world.com/affiche.data/releases/Stable/
DISTNAME=	Affiche-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Affiche allows people to stick notes
WWW=		http://www.collaboration-world.com/cgi-bin/project/index.cgi?pid=5

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Affiche

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Affiche.app/Affiche

.include <bsd.port.mk>
