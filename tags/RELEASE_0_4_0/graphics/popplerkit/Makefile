# New ports collection makefile for:    popplerkit
# Date created:         21 Jan 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/graphics/popplerkit/Makefile,v 1.5 2010/05/30 22:49:56 laffer1 Exp $
# $FreeBSD: ports/graphics/popplerkit/Makefile,v 1.3 2007/01/31 18:18:02 dinoex Exp $
#

PORTNAME=	popplerkit
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/etoile/
DISTNAME=	etoile-0.4.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework that supports rendering of PDF content
LICENSE=	gpl2

LIB_DEPENDS=	poppler:${PORTSDIR}/graphics/poppler

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNOME=	gnomeprefix gnomehack gtk20

WRKSRC=	${WRKDIR}/Etoile-0.4.1
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/PopplerKit

.include <bsd.port.mk>
