# New ports collection makefile for:    etoile-trackerkit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-trackerkit/Makefile,v 1.6 2008/08/20 19:56:06 crash Exp $
# $FreeBSD: ports/deskutils/etoile-trackerkit/Makefile,v 1.7 2007/01/31 18:17:53 dinoex Exp $
#

PORTNAME=	trackerkit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	4
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project TrackerKit framework
LICENSE=        lgpl
USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/TrackerKit

HEADERS=	TKCollection.h TKKeyValuePredicate.h TKObject.h \
		TKQuery.h TKTracker.h

post-install:
	${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Headers/TrackerKit
.for i in ${HEADERS}
	${INSTALL_DATA} ${WRKSRC}/Frameworks/TrackerKit/Headers/${i} \
		 ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/System/Library/Headers/TrackerKit/
.endfor

.include <bsd.port.mk>
