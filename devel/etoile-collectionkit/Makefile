# New ports collection makefile for:    etoile-collectionkit
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/devel/etoile-collectionkit/Makefile,v 1.3 2007/08/27 20:22:35 seirei Exp $
# $FreeBSD: ports/devel/etoile-collectionkit/Makefile,v 1.4 2007/01/31 18:17:55 dinoex Exp $
#

PORTNAME=	collectionkit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        lgpl
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides a common storage facility for records with properties

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
#DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/CollectionKit

.include <bsd.port.mk>
