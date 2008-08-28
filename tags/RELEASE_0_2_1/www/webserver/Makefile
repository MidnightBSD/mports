# New ports collection makefile for:	webserver
# Date created:         29 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/www/webserver/Makefile,v 1.2 2007/10/25 22:15:56 laffer1 Exp $
# $FreeBSD: ports/www/webserver/Makefile,v 1.4 2007/01/31 18:18:10 dinoex Exp $
#

PORTNAME=	webserver
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	www 
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	WebServer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for a GNUstep to act as HTTP or HTTPS server
LICENSE=	lgpl

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

DEFAULT_LIBVERSION=	1.1
DEFAULT_LIBVERSION2=	1.1.0
PLIST_SUB+=	LIBVERSION2=${DEFAULT_LIBVERSION2}
PLIST_SUB+=	MAJORLIBVERSION2=${DEFAULT_LIBVERSION2:C/([0-9]).*/\1/1}

.include <bsd.port.mk>
