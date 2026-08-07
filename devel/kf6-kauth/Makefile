PORTNAME=	kauth
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTREVISION=	1
CATEGORIES=	devel kde kde-frameworks

COMMENT=	Execute actions as privileged user
MAINTAINER=	ports@MidnightBSD.org

LIB_DEPENDS=	libpolkit-qt6-core-1.so:sysutils/polkit-qt-1@qt6

USES=		cmake kde:6 kfhack qt:6 tar:xz
USES+=	cpe
CPE_VENDOR=	kde
USE_KDE=	coreaddons kded windowsystem \
		ecm:build
USE_QT=		base

.include <bsd.port.mk>
