# New ports collection makefile for:    etoile-xwindowserverkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11/etoile-xwindowserverkit/Makefile,v 1.7 2008/08/21 16:20:35 laffer1 Exp $
# $FreeBSD: ports/x11/etoile-xwindowserverkit/Makefile,v 1.7 2007/01/31 18:18:13 dinoex Exp $
#

PORTNAME=	xwindowserverkit
PORTVERSION=	0.4.1
CATEGORIES=	x11 gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project XWindowServerKit frameowrk
LICENSE=	bsd3

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

DEFAULT_LIBVERSION=	0.1.1
WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/XWindowServerKit

.include <bsd.port.mk>
