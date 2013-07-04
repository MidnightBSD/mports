# New ports collection makefile for:    etoile-mollusk
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/www/etoile-mollusk/Makefile,v 1.2 2007/11/07 20:20:16 ctriv Exp $
# $FreeBSD: ports/www/etoile-mollusk/Makefile,v 1.2 2007/01/31 18:18:10 dinoex Exp $
#

PORTNAME=	mollusk
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	www gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RSS reader in general
LICENSE=        gpl3
USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	RSSKit:${RSSKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	BookmarkKit:${BOOKMARKKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	CollectionKit:${COLLECTIONKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	PaneKit:${PANEKIT_PORT}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Mollusk

RSSKIT_PORT?=	www/etoile-rsskit
BOOKMARKKIT_PORT?=	www/etoile-bookmarkkit
COLLECTIONKIT_PORT?=	devel/etoile-collectionkit
PANEKIT_PORT?=	deskutils/etoile-panekit

.include <bsd.port.mk>
