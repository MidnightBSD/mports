# New ports collection makefile for:    cddb-bundle
# Date created:         17 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#

PORTNAME=	cddb
PORTVERSION=	0.2
PORTREVISION=	4
CATEGORIES=	audio gnustep
MASTER_SITES=	SF/gsburn/cdplayer/${DISTNAME}
PKGNAMESUFFIX=	-bundle${PKGNAMESUFFIX2}
DISTNAME=	cdplayer-${CDPLAYER_VERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CDDB client bundle GNUstep

LICENSE=	gpl2 # or later
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build

CDPLAYER_VERSION=	0.5.1
WRKSRC=		${WRKDIR}/CDPlayer-${CDPLAYER_VERSION}/Cddb

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Bundles/Cddb.bundle/Cddb

.include <bsd.port.mk>
