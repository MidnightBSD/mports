# New ports collection makefile for:    etoile-addresseskit
# Date created:         8 Sep 2007
# Whom:                 seirei@MidnightBSD.org
#
# $MidnightBSD$
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

USES=           gnustep
USE_GNUSTEP=    back build
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/AddressesKit

.include <bsd.port.mk>
