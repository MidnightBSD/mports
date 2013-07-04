# New ports collection makefile for:    etoile-ogrekit
# Date created:         14 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/textproc/etoile-ogrekit/Makefile,v 1.5 2007/10/27 04:20:24 laffer1 Exp $
# $FreeBSD: ports/textproc/etoile-ogrekit/Makefile,v 1.5 2007/01/31 18:18:09 dinoex Exp $
#

PORTNAME=	ogrekit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	textproc gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd2
PKGNAMEPREFIX=	etoile-
DISTNAME=       etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project OgreKit framework

LIB_DEPENDS=	onig:${PORTSDIR}/${ONIGURUMA4_PORT}

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
MAKE_ENV+= old=yes
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/OgreKit

UNITKIT_PORT?=	devel/etoile-unitkit
ONIGURUMA4_PORT?=	devel/oniguruma4

.include <bsd.port.mk>
