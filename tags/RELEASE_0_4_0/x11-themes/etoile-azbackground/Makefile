# $MidnightBSD: mports/x11-themes/etoile-azbackground/Makefile,v 1.6 2009/12/13 21:01:03 laffer1 Exp $
# $FreeBSD: ports/x11-themes/etoile-azbackground/Makefile,v 1.3 2007/01/31 18:18:10 dinoex Exp $

PORTNAME=	azbackground
PORTVERSION=	0.4.1
PORTREVISION=	1
CATEGORIES=	x11-themes gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd2
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small GNUstep application to set xwindow background

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/AZBackground
#ADDITIONAL_INCLUDE_DIRS+=	-I${LOCALBASE}/include
#ADDITIONAL_LIB_DIRS+=	-L${LOCALBASE}/lib

XWINDOWSERVERKIT_PORT?=	x11/etoile-xwindowserverkit

.include <bsd.port.mk>
