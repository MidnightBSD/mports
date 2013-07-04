# New ports collection makefile for:    etoile-ui
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-ui/Makefile,v 1.5 2007/10/25 22:52:39 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-ui/Makefile,v 1.4 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	ui
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd3
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project EtoileUI framework

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/EtoileUI

.include <bsd.port.mk>
