PORTNAME=	httpserver
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	www
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight HTTP Server
WWW=		https://qt.io

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers

USES=		cmake compiler:c++11-lang pkgconfig qt-dist:6
USE_QT=		base

.include <bsd.port.mk>
