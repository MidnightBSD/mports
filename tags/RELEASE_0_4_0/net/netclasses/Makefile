# $MidnightBSD: mports/net/netclasses/Makefile,v 1.5 2009/10/03 03:07:17 laffer1 Exp $

PORTNAME=	netclasses
PORTVERSION=	1.06
PORTREVISION=	1
CATEGORIES=	net gnustep
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C framework for socket programming with GNUstep
LICENSE=	lgpl2.1

USE_GNUSTEP=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/${DISTNAME}
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
