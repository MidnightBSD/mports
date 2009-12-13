# New ports collection makefile for:    etoile-etoilemenus
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11-themes/etoile-etoilemenus/Makefile,v 1.5 2008/10/08 04:09:55 laffer1 Exp $
# $FreeBSD: ports/x11-themes/etoile-etoilemenus/Makefile,v 1.6 2007/01/31 18:18:11 dinoex Exp $
#

PORTNAME=	etoilemenus
PORTVERSION=	0.4.1
CATEGORIES=	x11-themes gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project EtoileMenus bundle
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Bundles/EtoileWildMenus

.include <bsd.port.mk>
