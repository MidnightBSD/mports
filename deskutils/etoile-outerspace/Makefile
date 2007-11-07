# New ports collection makefile for:    etoile-outerspace
# Date created:         9 Sep 2007
# Whom:                 seirei@MidnightBSD.org
#
# $MidnightBSD: mports/deskutils/etoile-outerspace/Makefile,v 1.2 2007/10/25 22:54:14 laffer1 Exp $
#

PORTNAME=	outerspace
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd3
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project EtoileUI framework

USE_XLIB=       yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

USE_GNUSTEP_LOCAL_LIBS+= \
	InspectorKit:${INSPECTORKIT_PORT} \
	EtoileUI:${ETOILEUI_PORT} \

USE_GNUSTEP_SYSTEM_LIBS+= \
	XWindowServerKit:${XWINDOWSERVERKIT_PORT} \

MAKE_FLAGS+=            OPTFLAG="${CFLAGS} -I${X11BASE}/include"

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/OuterSpace

INSPECTORKIT_PORT?=     deskutils/etoile-inspectorkit
ETOILEUI_PORT?=         deskutils/etoile-ui
XWINDOWSERVERKIT_PORT?= x11/etoile-xwindowserverkit

.include <bsd.port.mk>
