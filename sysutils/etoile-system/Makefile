# New ports collection makefile for:    etoile-system
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/sysutils/etoile-system/Makefile,v 1.1 2007/03/13 05:30:09 laffer1 Exp $
# $FreeBSD: ports/sysutils/etoile-system/Makefile,v 1.4 2007/01/31 18:18:08 dinoex Exp $
#

PORTNAME=	system
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	sysutils gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project System Tool

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
NO_FILTER_SHLIBS=       yes

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/System

post-install:
	${MKDIR} ${GNUSTEP_PREFIX}/System/Library/Etoile
	${CP} ${WRKSRC}/Services/Private/System/SystemTaskList.plist \
		${GNUSTEP_PREFIX}/System/Library/Etoile/

.include <bsd.port.mk>
