# $MidnightBSD$

PORTNAME=	nextgo
PORTVERSION=	3.0
PORTREVISION=	2
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	NeXTGo-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	classic Go game for OPENSTEP/GNUstep

LICENSE=	gpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile
	${REINPLACE_CMD} -e 's|PSWait|myPSWait|' \
		${WRKSRC}/Board.m

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/NeXTGo.app/NeXTGo

.include <bsd.port.mk>
