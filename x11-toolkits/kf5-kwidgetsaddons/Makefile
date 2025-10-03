PORTNAME=	kwidgetsaddons
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 addons to QtWidgets

USES=		cmake compiler:c++11-lib kde:5 kfhack pkgconfig qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core gui linguisttools uiplugin uitools widgets \
		buildtools:build qmake:build testlib:build

.include <bsd.port.mk>
