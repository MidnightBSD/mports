# $MidnightBSD: mports/devel/php-xdebug/Makefile,v 1.1 2009/02/18 21:58:36 laffer1 Exp $

PORTNAME=	xdebug
DISTVERSION=	2.1.0
CATEGORIES=	devel
MASTER_SITES=	http://www.xdebug.org/files/
PKGNAMEPREFIX=	php-
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xdebug extension for PHP
LICENSE=	other

USE_PHP=	yes
USE_PHPIZE=	yes
CONFIGURE_ARGS=	--enable-xdebug --with-php-config=${PREFIX}/bin/php-config
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_LIST=	PHP_EXT_DIR=${PHP_EXT_DIR}

do-install:
	@${MKDIR} ${PREFIX}/lib/php/${PHP_EXT_DIR}
	@${INSTALL_DATA} ${WRKSRC}/modules/xdebug.so \
		${PREFIX}/lib/php/${PHP_EXT_DIR}

.include <bsd.port.mk>
