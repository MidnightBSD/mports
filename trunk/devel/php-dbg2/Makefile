# $MidnightBSD$

PORTNAME=	dbg2
PORTVERSION=	2.15.5
CATEGORIES=	devel
MASTER_SITES=	SF
PKGNAMEPREFIX=	php-
DISTNAME=	dbg-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Debugger for PHP
LICENSE=	restricted

USE_PHP=	yes
USE_PHPIZE=	yes
DEFAULT_PHP_VER=5
CONFIGURE_ARGS=	--enable-dbg=shared --with-dbg-profiler \
		--with-php-config=${PREFIX}/bin/php-config \
		--prefix=${PREFIX}/lib/php/${PHP_EXT_DIR}
PKGMESSAGE=	pkg-message

.include <bsd.port.mk>
