# New ports collection makefile for:    etoile-panekit
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-panekit/Makefile,v 1.6 2007/10/25 22:50:43 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-panekit/Makefile,v 1.4 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	panekit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        lgpl
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework which provides flexible pane window in GNUstep

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/PaneKit

.include <bsd.port.mk>
