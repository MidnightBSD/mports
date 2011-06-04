# New ports collection makefile for:    batmon
# Date created:         05 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/sysutils/batmon/Makefile,v 1.2 2010/10/23 17:56:43 laffer1 Exp $
# $FreeBSD: ports/sysutils/batmon/Makefile,v 1.6 2008/07/08 19:21:30 dinoex Exp $
#

PORTNAME=	batmon
PORTVERSION=	0.5
CATEGORIES=	sysutils gnustep
MASTER_SITES= ${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=   gap

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep battery monitor for laptops
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
