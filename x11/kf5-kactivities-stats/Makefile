PORTNAME=	kactivities-stats
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11 kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 statistics for activities

BUILD_DEPENDS=	${LOCALBASE}/include/boost/range/algorithm.hpp:devel/boost-libs

USES=		cmake compiler:c++11-lib kde:5 pathfix qt:5 tar:xz
USE_KDE=	activities config \
		ecm:build
USE_QT=		core dbus sql \
		buildtools:build qmake:build

.include <bsd.port.mk>
