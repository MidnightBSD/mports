# New ports collection makefile for:    etoile-xwindowserverkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11/etoile-xwindowserverkit/Makefile,v 1.2 2007/08/20 07:12:19 laffer1 Exp $
# $FreeBSD: ports/x11/etoile-xwindowserverkit/Makefile,v 1.7 2007/01/31 18:18:13 dinoex Exp $
#

PORTNAME=	xwindowserverkit
PORTVERSION=	0.2.0
CATEGORIES=	x11 gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project XWindowServerKit frameowrk

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
#MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
NO_FILTER_SHLIBS=       yes

WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/XWindowServerKit
#ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
#ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib
#MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR="${GNUSTEP_SYSTEM_ROOT}"

.include <bsd.port.mk>
