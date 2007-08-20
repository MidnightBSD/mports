# New ports collection makefile for:    etoile-camaelon
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11-themes/etoile-camaelon/Makefile,v 1.1 2007/03/13 05:51:18 laffer1 Exp $
# $FreeBSD: ports/x11-themes/etoile-camaelon/Makefile,v 1.4 2007/01/31 18:37:27 dinoex Exp $
#

PORTNAME=	camaelon
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	x11-themes gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP_CH}
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile_0+${SNAPSHOT}+dfsg.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Camaelon bundle

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

SNAPSHOT=	20060917
WRKSRC=	${WRKDIR}/etoile-0+${SNAPSHOT}+dfsg/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Bundles/Camaelon

.include <bsd.port.mk>
