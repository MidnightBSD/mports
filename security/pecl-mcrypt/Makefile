PORTNAME=	mcrypt
PORTVERSION=	1.0.3
CATEGORIES=	security pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP extension for mcrypt, removed in PHP 7.2

LICENSE=	php

IGNORE_WITH_PHP=	71

LIB_DEPENDS=	libltdl.so:devel/libltdl \
		libmcrypt.so:security/libmcrypt

USES=	php:pecl

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

.include <bsd.port.mk>
