# $MidnightBSD: mports/devel/php-xdebug/Makefile,v 1.3 2013/04/11 12:56:44 laffer1 Exp $

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

.include <bsd.port.mk>
