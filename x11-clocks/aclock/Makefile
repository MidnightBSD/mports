PORTNAME=	aclock
PORTVERSION=	0.4.0
PORTREVISION=	8
CATEGORIES=	x11-clocks gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	AClock-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analog Clock for GNUstep
WWW=		https://gap.nongnu.org/aclock/index.html

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${DISTNAME}

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/AClock.app/AClock

.include <bsd.port.mk>
