PORTNAME=	knotifications
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

COMMENT=	Cross-platform library for creating popup notifications
MAINTAINER=	ports@MidnightBSD.org

LIB_DEPENDS=	libcanberra.so:audio/libcanberra

USES=		cmake gl kde:6 qt:6 tar:xz xorg
USE_GL=		gl opengl
USE_KDE=	config coreaddons windowsystem \
		ecm:build
USE_QT=		base declarative
USE_XORG=	x11 xtst

# Requires PySide and Shiboken.
CMAKE_OFF=	BUILD_PYTHON_BINDINGS

.include <bsd.port.mk>
