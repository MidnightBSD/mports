PORTNAME=	kwidgetsaddons
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

COMMENT=	Large set of desktop widgets
MAINTAINER=	ports@MidnightBSD.org

USES=		cmake gl kde:6 kfhack qt:6 tar:xz
USE_GL=		gl opengl
USE_KDE=	ecm:build
USE_QT=		base tools

NO_TEST=	yes

CMAKE_OFF=	BUILD_PYTHON_BINDINGS

.include <bsd.port.mk>
