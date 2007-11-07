# New ports collection makefile for:    etoile-lucenekit
# Date created:         14 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/textproc/etoile-lucenekit/Makefile,v 1.1 2007/03/13 06:46:13 laffer1 Exp $
# $FreeBSD: ports/textproc/etoile-lucenekit/Makefile,v 1.5 2007/01/31 18:18:09 dinoex Exp $
#

PORTNAME=	lucenekit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	textproc gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project OgreKit framework

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	OgreKit:${OGREKIT_PORT}
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/LuceneKit

OGREKIT_PORT?=	textproc/etoile-ogrekit

.include <bsd.port.mk>
