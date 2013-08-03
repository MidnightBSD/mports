# Ports collection makefile for:  pecl-crack
# Date created:			  12 Oct 2007
# Whom:				  Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/pecl-crack/Makefile,v 1.2 2011/06/19 19:30:01 laffer1 Exp $
#

PORTNAME=	crack
PORTVERSION=	0.4.1
PORTREVISION=	2
CATEGORIES=	security www
MASTER_SITES=	http://www.osuweb.net/~ahaning/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@midnightbsd.org
COMMENT=	PECL extension to cracklib
LICENSE=	php

LIB_DEPENDS=	crack:${PORTSDIR}/security/cracklib

USE_PHP=	yes
USE_PHPIZE=	yes
USE_PHP_BUILD=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	crack
DEFAULT_PHP_VER=53
IGNORE_WITH_PHP=5

WRKSRC=		${WRKDIR}/crack-0.4

.include <bsd.port.mk>
