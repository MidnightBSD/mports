PORTNAME=	remoteobjects
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	devel
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt6 Remote Objects module
WWW=		https://qt.io

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers

USES=		cmake compiler:c++11-lang gl pkgconfig qt-dist:6
USE_GL=		gl opengl
USE_QT=		base declarative

.include <bsd.port.mk>
