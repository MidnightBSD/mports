PORTNAME=	kirigami
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

COMMENT=	QtQuick components for building adaptable UIs
MAINTAINER=	ports@MidnightBSD.org

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		cmake gl kde:6 qt:6 tar:xz
USE_GL=		gl opengl
USE_KDE=	ecm:build
USE_QT=		base declarative shadertools svg tools

KDE_FRAMEWORKS_VERSION=	6.14.1
.include <bsd.port.mk>
