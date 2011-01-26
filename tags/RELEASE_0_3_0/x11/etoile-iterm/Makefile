# New ports collection makefile for:    etoile-iterm
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/x11/etoile-iterm/Makefile,v 1.2 2007/11/07 20:20:17 ctriv Exp $
# $FreeBSD: ports/x11/etoile-iterm/Makefile,v 1.6 2007/01/31 18:18:13 dinoex Exp $
#

PORTNAME=	iterm
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	x11 gnustep
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Terminal application
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Addresses:${ADDRESSES_PORT}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Terminal

ADDRESSES_PORT?=	mail/addresses

.include <bsd.port.mk>
