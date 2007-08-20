# New ports collection makefile for:    etoile-panekit
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-panekit/Makefile,v 1.1 2007/03/13 05:27:29 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-panekit/Makefile,v 1.4 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	panekit
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework which provides flexible pane window in GNUstep

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
NO_FILTER_SHLIBS=	yes

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/PaneKit

.include <bsd.port.mk>
