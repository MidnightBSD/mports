PORTNAME=	kplotting
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	graphics kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 lightweight plotting framework

USES=		cmake compiler:c++11-lib kde:5 kfhack qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core gui uiplugin widgets \
		buildtools:build qmake:build testlib:build

.include <bsd.port.mk>
