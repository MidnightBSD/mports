# New ports collection makefile for:    etoile-stepchat
# Date created:         8 Sep 2007
# Whom:                 seirei@MidnightBSD.org
#
# $MidnightBSD$
#

PORTNAME=	stepchat
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	net-im gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=       etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Jabber Client
LICENSE=	bsd3

USES=		gnustep
USE_GNUSTEP=	back base gui
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=        Addresses:${ADDRESSESKIT_PORT}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Jabber

ADDRESSESKIT_PORT?=  deskutils/etoile-addresseskit

.include <bsd.port.mk>
