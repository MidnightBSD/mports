PORTNAME=	serialbus
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	2
CATEGORIES=	comms
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt functions to access industrial bus systems
WWW=		https://qt.io

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers

USES=		cmake compiler:c++11-lib qt-dist:6
USE_QT=		base serialport

.include <bsd.port.mk>
