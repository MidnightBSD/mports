# New ports collection makefile for:	projectmanager
# Date created:         28 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/devel/projectmanager/Makefile,v 1.4 2007/11/07 20:20:12 ctriv Exp $
# $FreeBSD: ports/devel/projectmanager/Makefile,v 1.5 2007/05/25 05:55:24 dinoex Exp $
#

PORTNAME=	projectmanager
PORTVERSION=	0.2
PORTREVISION=	5
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/pmanager/0.2/
DISTNAME=	ProjectManager-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, but very usable development environment
LICENSE=	gpl

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	WizardKit:${WIZARDKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	HighlighterKit:${HIGHLIGHTERKIT_PORT}

MAKE_FLAGS+=	debug=no

WIZARDKIT_PORT?=		devel/wizardkit
HIGHLIGHTERKIT_PORT?=		devel/highlighterkit

.include <bsd.port.mk>
