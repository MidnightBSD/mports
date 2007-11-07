# New ports collection makefile for:    etoile-menuserver
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-menuserver/Makefile,v 1.3 2007/08/27 20:55:16 seirei Exp $
# $FreeBSD: ports/deskutils/etoile-menuserver/Makefile,v 1.5 2007/01/31 18:17:52 dinoex Exp $
#

PORTNAME=	menuserver
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        gpl2
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project MenuServer application

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}
USE_GNUSTEP_SYSTEM_LIBS+=	WorkspaceCommKit:${ETOILE_SYSTEM_PORT}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/MenuServer
#ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
#ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib

XWINDOWSERVERKIT_PORT?=		x11/etoile-xwindowserverkit
ETOILE_SYSTEM_PORT?=		sysutils/etoile-system

.include <bsd.port.mk>
