# New ports collection makefile for:    etoile-azdock
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11-wm/etoile-azdock/Makefile,v 1.4 2007/11/07 20:20:18 ctriv Exp $
# $FreeBSD: ports/x11-wm/etoile-azdock/Makefile,v 1.5 2007/01/31 18:18:12 dinoex Exp $
#

PORTNAME=	azdock
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=   3
CATEGORIES=	x11-wm gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd3
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project AZDock is a wm-dock

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	BookmarkKit:${BOOKMARKKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	IconKit:${ICONKIT_PORT}

SNAPSHOT=	20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/AZDock
#ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
#ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib

XWINDOWSERVERKIT_PORT?=		x11/etoile-xwindowserverkit
BOOKMARKKIT_PORT?=	www/etoile-bookmarkkit
ICONKIT_PORT?=     x11-themes/etoile-iconkit

.include <bsd.port.mk>
