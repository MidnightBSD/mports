# $MidnightBSD: mports/net/netclasses/Makefile,v 1.4 2008/02/27 20:52:57 laffer1 Exp $

PORTNAME=	netclasses
PORTVERSION=	1.06
CATEGORIES=	net gnustep
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C framework for socket programming with GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/${DISTNAME}
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
