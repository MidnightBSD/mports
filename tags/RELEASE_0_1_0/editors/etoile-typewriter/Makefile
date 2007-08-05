# New ports collection makefile for:    etoile-typewriter
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/editors/etoile-typewriter/Makefile,v 1.5 2007/01/31 18:17:58 dinoex Exp $
#

PORTNAME=	typewriter
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	editors gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General text editor for plain and rich format text

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	OgreKit:${OGREKIT_PORT}
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Typewriter

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
OGREKIT_PORT?=	textproc/etoile-ogrekit

.include <bsd.port.mk>
