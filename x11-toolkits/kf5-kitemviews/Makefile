PORTNAME=	kitemviews
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 widget addons for Qt Model/View

USES=		cmake compiler:c++11-lib kde:5 qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core gui linguisttools uiplugin widgets \
		buildtools:build qmake:build testlib:build

.include <bsd.port.mk>
