# New ports collection makefile for:    ProjectCenter
# Date created:         22 Sep 2000
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/projectcenter.app/Makefile,v 1.33 2006/03/19 04:35:44 dinoex Exp $
#

PORTNAME=	projectcenter.app
PORTVERSION=	0.4.3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	dev-apps
DISTNAME=	ProjectCenter-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A development environment for GNUstep

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
PLIST_SUB+=	FRAMEVERSION=${PORTVERSION}

.include <bsd.port.mk>
