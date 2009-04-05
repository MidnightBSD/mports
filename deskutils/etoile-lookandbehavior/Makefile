# New ports collection makefile for:    etoile-lookandbehavior
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-lookandbehavior/Makefile,v 1.3 2008/08/20 19:56:06 crash Exp $
# $FreeBSD: ports/deskutils/etoile-lookandbehavior/Makefile,v 1.5 2007/01/31 18:17:52 dinoex Exp $
#

PORTNAME=	lookandbehavior
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project LookAndBehavior application
LICENSE=        lgpl
USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	PaneKit:${PANEKIT_PORT}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/LookAndBehavior

PANEKIT_PORT?=	deskutils/etoile-panekit

.include <bsd.port.mk>
