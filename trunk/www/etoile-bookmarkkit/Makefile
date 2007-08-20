# New ports collection makefile for:    etoile-bookmarkkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/www/etoile-bookmarkkit/Makefile,v 1.1 2007/03/13 06:10:18 laffer1 Exp $
# $FreeBSD: ports/www/etoile-bookmarkkit/Makefile,v 1.6 2007/01/31 18:18:09 dinoex Exp $
#

PORTNAME=	bookmarkkit
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	www gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project BookmarkKit framework

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	CollectionKit:${COLLECTIONKIT_PORT}
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
NO_FILTER_SHLIBS=       yes

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/BookmarkKit

COLLECTIONKIT_PORT?=	devel/etoile-collectionkit

.include <bsd.port.mk>
