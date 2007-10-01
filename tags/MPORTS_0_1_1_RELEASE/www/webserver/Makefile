# New ports collection makefile for:	webserver
# Date created:         29 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/www/webserver/Makefile,v 1.1 2006/10/31 06:13:48 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	webserver
PORTVERSION=	1.1.0
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	WebServer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for a GNUstep to act as HTTP or HTTPS server

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
ALL_TARGET=
LDCONFIG_DIRS=	${LOCALLIBDIR}
INSTALLS_SHLIB=	yes
NO_FILTER_SHLIBS=	yes

.include <bsd.port.mk>
