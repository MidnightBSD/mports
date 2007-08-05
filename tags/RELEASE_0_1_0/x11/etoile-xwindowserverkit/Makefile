# New ports collection makefile for:    etoile-xwindowserverkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/x11/etoile-xwindowserverkit/Makefile,v 1.7 2007/01/31 18:18:13 dinoex Exp $
#

PORTNAME=	xwindowserverkit
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	x11 gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project XWindowServerKit frameowrk

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/XWindowServerKit
ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR="${GNUSTEP_SYSTEM_ROOT}"

.include <bsd.port.mk>
