# New ports collection makefile for:    ticker
# Date created:         29 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/www/gnustep-ticker/Makefile,v 1.6 2008/10/08 04:49:04 laffer1 Exp $
# $FreeBSD: ports/www/gnustep-ticker/Makefile,v 1.3 2007/01/31 18:18:10 dinoex Exp $
#

PORTNAME=	ticker
PORTVERSION=	0.1
PORTREVISION=	4
CATEGORIES=	www gnustep
MASTER_SITES=	http://www.gnustep.it/marko/Ticker/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	Ticker
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=    repacked

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RSS monitor for RSS and Atom feeds
LICENSE=	gpl2

RUN_DEPENDS+=	lynx:${PORTSDIR}/www/lynx

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

.include <bsd.port.mk>
