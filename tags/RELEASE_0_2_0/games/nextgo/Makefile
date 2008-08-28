# New ports collection makefile for:    nextgo
# Date created:         05 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/games/nextgo/Makefile,v 1.1 2007/04/07 23:46:04 laffer1 Exp $
# $FreeBSD: ports/games/nextgo/Makefile,v 1.3 2007/01/31 18:18:00 dinoex Exp $
#

PORTNAME=	nextgo
PORTVERSION=	3.0
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	http://download.savannah.gnu.org/releases/gap/
DISTNAME=	NeXTGo-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	classic Go game for OPENSTEP/GNUstep

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
