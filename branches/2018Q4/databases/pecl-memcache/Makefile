# $MidnightBSD$

PORTNAME=	memcache
PORTVERSION=	3.0.8
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
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd10.4

.if !defined(NOPORTEXAMPLES)
post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/example.php ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
