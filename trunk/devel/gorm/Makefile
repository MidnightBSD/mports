# New ports collection makefile for:    gorm
# Date created:         15 Mar 2002
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/devel/gorm/Makefile,v 1.8 2008/10/30 16:55:59 laffer1 Exp $
# $FreeBSD: ports/devel/gorm/Makefile,v 1.27 2006/08/31 05:40:32 dinoex Exp $
#

PORTNAME=	gorm
PORTVERSION=	1.2.10
CATEGORIES=	devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	dev-apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical Object Relationship Modeller
LICENSE=	gpl3

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
DEFAULT_LIBVERSION=	1.1.0

MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.include <bsd.port.mk>
