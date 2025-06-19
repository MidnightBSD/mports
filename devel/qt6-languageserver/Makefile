PORTNAME=	languageserver
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 6 implementation of the Language Server Protocol

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers

USES=		cmake compiler:c++17-lang pkgconfig qt-dist:6
USE_QT=		base:build

pre-fake:
	${MKDIR} ${PREFIX}/lib/qt6/pkgconfig

.include <bsd.port.mk>
