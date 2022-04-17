# Created by: Andrey Slusar <anray@FreeBSD.org>

PORTNAME=	imagick
PORTVERSION=	3.6.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	PHP wrapper to the ImageMagick/GraphicsMagick library version 6

LICENSE=	php

USES=		cpe php:pecl pkgconfig localbase

CPE_VENDOR=	php

CONFLICTS_INSTALL?=	${PKGNAMEPREFIX}${PORTNAME}-im7-[0-9]*

OPTIONS_DEFINE=	X11

X11_LIB_DEPENDS?=	libMagickWand-6.so:graphics/ImageMagick6
X11_LIB_DEPENDS_OFF?=	libMagickWand-6.so:graphics/ImageMagick6-nox11

CONFIGURE_ARGS=	--with-imagick=${LOCALBASE}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

.include <bsd.port.mk>
