# New ports collection makefile for:    etoile-servicesbarkit
#
# $MidnightBSD: mports/deskutils/etoile-servicesbarkit/Makefile,v 1.7 2011/09/03 00:31:54 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-servicesbarkit/Makefile,v 1.6 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	servicesbarkit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	5
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project ServicesBarKit framework
LICENSE=        lgpl

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	UnitKit:${UNITKIT_PORT}
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/ServicesBarKit

UNITKIT_PORT?=	devel/etoile-unitkit

.include <bsd.port.mk>
