PORTNAME=	craft
PORTVERSION=	1.0
DISTVERSIONPREFIX=	v
DISTVERSIONSUFFIX=	fbsd
PORTREVISION=	10
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Minecraft clone written in C using modern OpenGL
WWW=		https://www.michaelfogleman.com/craft/

LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		cmake:insource compiler:c11 gl xorg

USE_GITHUB=	yes
GH_ACCOUNT=	daniloegea
GH_PROJECT=	Craft

USE_XORG=	x11 xi xrandr xxf86vm
USE_GL=		gl glu

.include <bsd.port.mk>
