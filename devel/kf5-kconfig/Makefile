PORTNAME=	kconfig
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 widgets for configuration dialogs

# Sources say LGPL20+, KDE policy says LGPL21+, license file is LGPL21
LICENSE=	LGPL21+

USES=		cmake compiler:c++11-lib cpe kde:5 qt:5 tar:xz
CPE_VENDOR=	kde
USE_KDE=	ecm:build
USE_QT=		core dbus declarative gui linguisttools network xml \
		buildtools:build qmake:build testlib:build

.include <bsd.port.mk>
