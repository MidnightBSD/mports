PORTNAME=	translations
DISTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	devel
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 6 translation module
WWW=		https://qt-project.org

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

USES=		cmake compiler:c++17-lang \
		qt-dist:6
USE_QT=		base tools
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

NO_ARCH=	yes

.include <bsd.port.mk>
