# New ports collection makefile for:    etoile-azbackground
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11-themes/etoile-azbackground/Makefile,v 1.4 2007/11/07 20:20:17 ctriv Exp $
# $FreeBSD: ports/x11-themes/etoile-azbackground/Makefile,v 1.3 2007/01/31 18:18:10 dinoex Exp $
#

PORTNAME=	azbackground
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	x11-themes gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd2
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small GNUstep application to set xwindow background

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/AZBackground
#ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
#ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib

XWINDOWSERVERKIT_PORT?=	x11/etoile-xwindowserverkit

.include <bsd.port.mk>
