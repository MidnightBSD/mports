# New ports collection makefile for:    etoile-inspectorkit
# Date created:         9 Sep 2007
# Whom:                 seirei@MidnightBSD.org
#
# $MidnightBSD: mports/deskutils/etoile-inspectorkit/Makefile,v 1.3 2007/10/25 22:53:41 laffer1 Exp $
#

PORTNAME=	inspectorkit
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
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+= PaneKit:${PANEKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+= IconKit:${ICONKIT_PORT}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/InspectorKit

PANEKIT_PORT?= deskutils/etoile-panekit
ICONKIT_PORT?= x11-themes/etoile-iconkit

.include <bsd.port.mk>
