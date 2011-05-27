# $MidnightBSD: mports/databases/pecl-memcache/Makefile,v 1.1 2010/11/11 01:15:00 laffer1 Exp $

PORTNAME=	memcache
PORTVERSION=	3.0.5
CATEGORIES=	databases
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Memcached extension
LICENSE=	php

USE_PHP=	zlib session
USE_PHP_BUILD=	yes
USE_PHPIZE=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	memcache

USE_DOS2UNIX=	yes

CONFIGURE_ARGS=	--with-zlib-dir=/usr

.if !defined(NOPORTEXAMPLES)
post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/example.php ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
