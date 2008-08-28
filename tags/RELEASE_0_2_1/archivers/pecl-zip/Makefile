# New ports collection makefile for:	pecl-zip
# Date created:			9 Jul 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/pecl-zip/Makefile,v 1.4 2008/03/11 23:40:21 laffer1 Exp $
# $FreeBSD: ports/archivers/pecl-zip/Makefile,v 1.9 2006/12/31 11:05:09 ale Exp $
#

PORTNAME=	zip
PORTVERSION=	1.9.0
CATEGORIES=	archivers
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension to create and read zip files
LICENSE=	php

USE_PHP=	pcre
USE_PHP_BUILD=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--enable-zip --with-zlib-dir=/usr

.include <bsd.port.mk>
