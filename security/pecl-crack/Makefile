# Ports collection makefile for:  pecl-crack
# Date created:			  12 Oct 2007
# Whom:				  Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/pecl-crack/Makefile,v 1.1 2007/10/12 17:10:05 laffer1 Exp $
#

PORTNAME=	crack
PORTVERSION=	0.4.1
PORTREVISION=	1
CATEGORIES=	security www
MASTER_SITES=	http://www.osuweb.net/~ahaning/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@midnightbsd.org
COMMENT=	PECL extension to cracklib
LICENSE=	php

RUN_DEPENDS=	${LOCALBASE}/libdata/cracklib/pw_dict.pwi:${PORTSDIR}/security/cracklib

USE_PHP=	yes
USE_PHPIZE=	yes
USE_PHP_BUILD=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	crack

WRKSRC=		${WRKDIR}/crack-0.4

.include <bsd.port.mk>
