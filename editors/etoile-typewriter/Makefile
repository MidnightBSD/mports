# New ports collection makefile for:    etoile-typewriter
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/editors/etoile-typewriter/Makefile,v 1.3 2007/08/27 21:00:19 seirei Exp $
# $FreeBSD: ports/editors/etoile-typewriter/Makefile,v 1.5 2007/01/31 18:17:58 dinoex Exp $
#

PORTNAME=	typewriter
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	editors gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd3
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General text editor for plain and rich format text

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	OgreKit:${OGREKIT_PORT}
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Typewriter

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
OGREKIT_PORT?=	textproc/etoile-ogrekit

.include <bsd.port.mk>
