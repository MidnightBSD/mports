# New ports collection makefile for:    etoile-unitkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/devel/etoile-unitkit/Makefile,v 1.2 2007/08/21 12:02:37 seirei Exp $
# $FreeBSD: ports/devel/etoile-unitkit/Makefile,v 1.7 2007/01/31 18:17:56 dinoex Exp $
#

PORTNAME=	unitkit
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        apache2
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project UnitKit test framework on GNUstep

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/UnitKit

.include <bsd.port.mk>
