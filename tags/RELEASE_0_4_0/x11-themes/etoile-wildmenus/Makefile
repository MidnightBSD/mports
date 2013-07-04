# New ports collection makefile for:    etoile-wildmenus
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11-themes/etoile-wildmenus/Makefile,v 1.3 2007/08/27 21:02:41 seirei Exp $
# $FreeBSD: ports/x11-themes/etoile-wildmenus/Makefile,v 1.6 2007/01/31 18:18:11 dinoex Exp $
#

PORTNAME=	wildmenus
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	x11-themes gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        unknown
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project WildMenus bundle

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Bundles/EtoileWildMenus

.include <bsd.port.mk>
