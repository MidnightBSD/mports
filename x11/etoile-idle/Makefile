# $MidnightBSD: mports/x11/etoile-idle/Makefile,v 1.1 2010/01/21 01:22:34 laffer1 Exp $

PORTNAME=	idle
PORTVERSION=	0.4.1
PORTREVISION=	1
CATEGORIES=	x11 gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Idle event generator
LICENSE=	unknown

BUILD_DEPENDS=	${LOCALBASE}/include/X11/extensions/scrnsaver.h:${PORTSDIR}/x11/scrnsaverproto

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}
USE_XORG=	xscrnsaver

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/Idle
PLIST_FILES=	GNUstep/System/Tools/Idle

XWINDOWSERVERKIT_PORT?=		x11/etoile-xwindowserverkit

.include <bsd.port.mk>
