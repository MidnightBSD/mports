# New ports collection makefile for:    etoile-addresseskit
# Date created:         8 Sep 2007
# Whom:                 seirei@MidnightBSD.org
#
# $MidnightBSD: mports/deskutils/etoile-addresseskit/Makefile,v 1.3 2007/11/07 20:20:10 ctriv Exp $
#

PORTNAME=	addresseskit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        lgpl
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project AddressesKit framework
LICENSE=	lgpl

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/AddressesKit

.include <bsd.port.mk>
