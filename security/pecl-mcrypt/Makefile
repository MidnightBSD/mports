PORTNAME=	mcrypt
PORTVERSION=	1.0.4
CATEGORIES=	security pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP extension for mcrypt, removed in PHP 7.2

LICENSE=	php

IGNORE_WITH_PHP=	71

LIB_DEPENDS=	libltdl.so:devel/libltdl \
		libmcrypt.so:security/libmcrypt

USES=	php:pecl

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

post-patch:
	${REINPLACE_CMD} -e 's/RETURN_FALSE$$/RETURN_FALSE;/g' ${WRKSRC}/mcrypt.c
	${REINPLACE_CMD} -e 's/RETURN_TRUE$$/RETURN_TRUE;/g' ${WRKSRC}/mcrypt.c

.include <bsd.port.mk>
