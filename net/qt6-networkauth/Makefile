PORTNAME=	networkauth
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	net
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt6 Network authentication module

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

USES=		cmake gl compiler:c++17-lang \
		qt-dist:6
USE_GL=		opengl
USE_QT=		base
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
