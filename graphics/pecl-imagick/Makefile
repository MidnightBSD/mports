PORTNAME=	imagick
PORTVERSION=	3.7.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	PHP wrapper to the ImageMagick/GraphicsMagick library version 6
WWW=		https://pecl.php.net/package/imagick

LICENSE=	php

USES=		cpe php:pecl localbase

CPE_VENDOR=	php

CONFLICTS_INSTALL?=	${PKGNAMEPREFIX}${PORTNAME}-im7

OPTIONS_DEFINE=	X11

X11_USES?=		magick:6
X11_USES_OFF?=		magick:6,nox11

CONFIGURE_ARGS=	--with-imagick=${LOCALBASE}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

.include <bsd.port.mk>
