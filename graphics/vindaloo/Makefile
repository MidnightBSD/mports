# New ports collection makefile for:    vindaloo
# Date created:         15 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/graphics/vindaloo/Makefile,v 1.2 2007/11/07 20:20:13 ctriv Exp $
# $FreeBSD: ports/graphics/vindaloo/Makefile,v 1.2 2007/01/31 18:18:03 dinoex Exp $
#

PORTNAME=	vindaloo
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/Vindaloo/
DISTNAME=	Vindaloo-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PDF Reader for GNUstep
LICENSE=        gpl2
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	PopplerKit:${POPPLERKIT_PORT}

WRKSRC=		${WRKDIR}/Vindaloo

POPPLERKIT_PORT?=	graphics/popplerkit

.include <bsd.port.mk>
