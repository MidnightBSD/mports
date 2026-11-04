PORTNAME=	kemoticons
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-themes kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library to convert emoticons

USES=		cmake compiler:c++11-lib kde:5 kfhack qt:5 tar:xz
USE_KDE=	archive config coreaddons service \
		ecm:build
USE_QT=		core dbus gui xml \
		buildtools:build qmake:build

.include <bsd.port.mk>
