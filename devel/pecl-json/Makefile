# New ports collection makefile for:	pecl-json
# Date created:			2006-03-17
# Whom:				Alexander Zhuravlev <zaa@zaa.pp.ru>
#
# $MidnightBSD: mports/devel/pecl-json/Makefile,v 1.2 2008/05/15 08:24:12 laffer1 Exp $
# $FreeBSD: ports/devel/pecl-json/Makefile,v 1.2 2006/03/27 21:27:51 thierry Exp $
#

PORTNAME=	json
PORTVERSION=	1.2.1
CATEGORIES=	devel www
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
DISTNAME=	json-${PORTVERSION}
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP extension for JSON (JavaScript Object Notation) serialization
LICENSE=	php

USE_PHP=	yes
USE_PHPEXT=	yes
DEFAULT_PHP_VER=	5
PHP_MODNAME=	${PORTNAME}

.include <bsd.port.mk>
