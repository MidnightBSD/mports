PORTNAME=	quickeffectmaker
DISTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for creating shader effects for Qt Quick
WWW=		https://qt.io

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		cmake compiler:c++17-lang gl pkgconfig qt-dist:6
USE_GL=		gl opengl
USE_QT=		base declarative quick3d shadertools

.include <bsd.port.mk>
