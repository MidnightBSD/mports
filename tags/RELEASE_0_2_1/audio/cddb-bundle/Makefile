# New ports collection makefile for:    cddb-bundle
# Date created:         17 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/audio/cddb-bundle/Makefile,v 1.2 2007/11/07 20:20:09 ctriv Exp $
# $FreeBSD: ports/audio/cddb-bundle/Makefile,v 1.3 2007/01/31 18:17:49 dinoex Exp $
#

PORTNAME=	cddb
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	audio gnustep
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gsburn
PKGNAMESUFFIX=	-bundle${PKGNAMESUFFIX2}
DISTNAME=	cddb.bundle-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CDDB client bundle GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/cddb.bundle

.include <bsd.port.mk>
