PORTNAME=	virtualkeyboard
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 6 Virtual Keyboard Module
WWW=		https://qt.io

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers
LIB_DEPENDS=	libhunspell-1.7.so:textproc/hunspell \
		libxkbcommon.so:x11/libxkbcommon

USES=		cmake compiler:c++11-lang gl pkgconfig qt-dist:6 xorg
USE_GL=		gl opengl
USE_QT=		base declarative svg
USE_XORG=	xcb

.include <bsd.port.mk>
