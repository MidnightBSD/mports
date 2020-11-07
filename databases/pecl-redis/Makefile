PORTNAME=	redis
PORTVERSION=	5.3.2
PORTREVISION=	0
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension to access Redis

LICENSE=	php
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		php:pecl
USE_PHP=	hash:build json:build session:build

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

OPTIONS_DEFINE=	IGBINARY
IGBINARY_DESC=	Build with Igbinary serializer

IGBINARY_CONFIGURE_ENABLE=	redis-igbinary
IGBINARY_USE=			PHP=igbinary:build

.include <bsd.port.mk>
