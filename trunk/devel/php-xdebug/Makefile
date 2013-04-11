# $MidnightBSD: mports/devel/php-xdebug/Makefile,v 1.2 2011/01/08 01:19:58 laffer1 Exp $

PORTNAME=	xdebug
PORTVERSION=	2.2.1
CATEGORIES=	devel
MASTER_SITES=	http://www.xdebug.org/files/
PKGNAMEPREFIX=	php-
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xdebug extension for PHP
LICENSE=	other

CONFIGURE_ARGS=	--enable-xdebug
USE_PHP=	yes
USE_PHPEXT=	yes
USE_PHPIZE=	yes
SUB_FILES=	pkg-message

PKGMESSAGE=	${WRKDIR}/pkg-message

#do-install:
#	@${MKDIR} ${PREFIX}/lib/php/${PHP_EXT_DIR}
#	@${INSTALL_DATA} ${WRKSRC}/modules/xdebug.so \
#		${PREFIX}/lib/php/${PHP_EXT_DIR}

.include <bsd.port.mk>
