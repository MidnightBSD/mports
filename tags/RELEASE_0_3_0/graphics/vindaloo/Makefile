# New ports collection makefile for:    vindaloo
# Date created:         15 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/graphics/vindaloo/Makefile,v 1.3 2009/05/27 20:50:14 crash Exp $
# $FreeBSD: ports/graphics/vindaloo/Makefile,v 1.2 2007/01/31 18:18:03 dinoex Exp $
#

PORTNAME=	vindaloo
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/etoile/
DISTNAME=	etoile-0.4.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PDF Reader for GNUstep
LICENSE=        gpl2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	PopplerKit:${POPPLERKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	IconKit:${ICONKIT_PORT}

WRKSRC=	${WRKDIR}/Etoile-0.4.1
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Vindaloo

POPPLERKIT_PORT?=	graphics/popplerkit
ICONKIT_PORT?=	x11-themes/etoile-iconkit

.include <bsd.port.mk>
