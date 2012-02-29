# $MidnightBSD: mports/games/nextgo/Makefile,v 1.5 2009/04/05 15:43:49 laffer1 Exp $

PORTNAME=	nextgo
PORTVERSION=	3.0
PORTREVISION=	2
CATEGORIES=	games gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	NeXTGo-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	classic Go game for OPENSTEP/GNUstep
LICENSE=	gpl

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile
	${REINPLACE_CMD} -e 's|PSWait|myPSWait|' \
		${WRKSRC}/Board.m

.include <bsd.port.mk>
