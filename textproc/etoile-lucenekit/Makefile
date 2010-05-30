# New ports collection makefile for:    etoile-lucenekit
# Date created:         14 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/textproc/etoile-lucenekit/Makefile,v 1.2 2007/11/07 20:20:16 ctriv Exp $
# $FreeBSD: ports/textproc/etoile-lucenekit/Makefile,v 1.5 2007/01/31 18:18:09 dinoex Exp $
#

PORTNAME=	lucenekit
PORTVERSION=	0.4.1
CATEGORIES=	textproc gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project OgreKit framework
LICENSE=	apache2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	OgreKit:${OGREKIT_PORT}
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

DEFAULT_LIBVERSION=	0.1.1
WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/LuceneKit

OGREKIT_PORT?=	textproc/etoile-ogrekit

post-configure:
	${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/etoile.make

.include <bsd.port.mk>
