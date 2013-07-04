# New ports collection makefile for:    etoile-unitkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/devel/etoile-unitkit/Makefile,v 1.3 2007/11/07 20:20:11 ctriv Exp $
# $FreeBSD: ports/devel/etoile-unitkit/Makefile,v 1.7 2007/01/31 18:17:56 dinoex Exp $
#

PORTNAME=	unitkit
PORTVERSION=	1.3
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.4.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project UnitKit test framework on GNUstep
LICENSE=	apache2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=	${WRKDIR}/Etoile-0.4.1
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/UnitKit

.include <bsd.port.mk>
