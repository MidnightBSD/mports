PORTNAME=	serialport
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	comms
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt functions to access serial ports
WWW=		https://qt.io

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers
LIB_DEPENDS=	libudev.so:devel/libudev-devd

USES=		cmake compiler:c++11-lib pkgconfig qt-dist:6
USE_QT=		base

.include <bsd.port.mk>
