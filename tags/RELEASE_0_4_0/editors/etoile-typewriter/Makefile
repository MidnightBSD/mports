# New ports collection makefile for:    etoile-typewriter
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/editors/etoile-typewriter/Makefile,v 1.4 2007/11/07 20:20:13 ctriv Exp $
# $FreeBSD: ports/editors/etoile-typewriter/Makefile,v 1.5 2007/01/31 18:17:58 dinoex Exp $
#

PORTNAME=	typewriter
PORTVERSION=	0.4.1
CATEGORIES=	editors gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd3
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General text editor for plain and rich format text

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	OgreKit:${OGREKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	ScriptKit:${SCRIPTKIT_PORT}
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Typewriter

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}

OGREKIT_PORT?=	textproc/etoile-ogrekit
SCRIPTKIT_PORT?=	lang/etoile-scriptkit

.include <bsd.port.mk>
