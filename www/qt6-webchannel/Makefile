PORTNAME=	webchannel
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	www
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 6 library for integration of C++/QML with HTML/js clients
WWW=		https://qt.io

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers

USES=		cmake compiler:c++11-lang gl pkgconfig qt-dist:6
USE_GL=		gl opengl
USE_QT=		base declarative websockets

.include <bsd.port.mk>
