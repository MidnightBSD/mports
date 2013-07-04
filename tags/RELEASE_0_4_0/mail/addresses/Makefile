# $MidnightBSD: mports/mail/addresses/Makefile,v 1.5 2008/06/23 01:54:41 laffer1 Exp $

PORTNAME=	addresses
PORTVERSION=	0.4.7
PORTREVISION=	2
CATEGORIES=	mail gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	Addresses-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A versatile addressbook for GNUstep
LICENSE=	lgpl

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
USE_GNUSTEP_LDCONFIG= ${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=               ${WRKDIR}/Addresses

.include <bsd.port.mk>
