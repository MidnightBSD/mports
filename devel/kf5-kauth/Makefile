PORTNAME=	kauth
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTREVISION=	1
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 abstraction to system policy and authentication features

LIB_DEPENDS=	libpolkit-qt5-core-1.so:sysutils/polkit-qt-1@qt5

USES=		cmake compiler:c++11-lib cpe kde:5 qt:5 tar:xz
CPE_VENDOR=	kde
USE_KDE=	coreaddons \
		ecm:build
USE_QT=		core dbus gui linguisttools widgets \
		buildtools:build qmake:build

.include <bsd.port.mk>
