# New ports collection makefile for:    etoile-systemconfig
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-systemconfig/Makefile,v 1.1 2007/03/13 05:27:29 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-systemconfig/Makefile,v 1.4 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	systemconfig
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework which provides a way to set system preferences

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
NO_FILTER_SHLIBS=       yes

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/SystemConfig

.include <bsd.port.mk>
