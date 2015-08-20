# New ports collection makefile for:    etoile-extendedworkspacekit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/deskutils/etoile-extendedworkspacekit/Makefile,v 1.6 2007/01/31 18:17:52 dinoex Exp $
#

PORTNAME=	extendedworkspacekit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	4
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project ExtendedWorkspaceKit framework
LICENSE=        lgpl

USES=           gnustep tar:bzip2
USE_GNUSTEP=    back build
USE_GNUSTEP_SYSTEM_LIBS+=	TrackerKit:${TRACKERKIT_PORT}
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/ExtendedWorkspaceKit

TRACKERKIT_PORT?=	deskutils/etoile-trackerkit

.include <bsd.port.mk>
