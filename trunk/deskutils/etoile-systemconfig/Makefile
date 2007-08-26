# New ports collection makefile for:    etoile-systemconfig
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-systemconfig/Makefile,v 1.3 2007/08/20 07:02:16 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-systemconfig/Makefile,v 1.4 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	systemconfig
PORTVERSION=	0.2.0
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        lgpl
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework which provides a way to set system preferences

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
#DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
NO_FILTER_SHLIBS=       yes

WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/SystemConfig

.include <bsd.port.mk>
