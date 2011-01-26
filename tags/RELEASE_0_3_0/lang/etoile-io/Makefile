# New ports collection makefile for:    etoile-io
# Date created:         19 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/lang/etoile-io/Makefile,v 1.3 2007/01/31 18:18:03 dinoex Exp $
# $MidnightBSD: mports/lang/etoile-io/Makefile,v 1.5 2007/11/15 18:34:08 laffer1 Exp $
#

PORTNAME=	io
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	lang gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd2
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Io Language

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	DistributedView:${DISTRIBUTEDVIEW_PORT}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Languages/Io
HEADER_DIR=	Local/Library/Headers/Io

DISTRIBUTEDVIEW_PORT?=	deskutils/etoile-distributedview

.include <bsd.port.mk>
