PORTNAME=	kidletime
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTREVISION=	1
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library for monitoring user activity

BUILD_DEPENDS=	wayland-protocols>=1.27:graphics/wayland-protocols
LIB_DEPENDS=	libwayland-client.so:graphics/wayland

USES=		cmake compiler:c++11-lib kde:5 pkgconfig qt:5 tar:xz xorg
USE_KDE=	ecm:build plasma-wayland-protocols:build
USE_QT=		core dbus gui wayland x11extras \
		buildtools:build qmake:build
USE_XORG=	ice sm x11 xext xcb xscrnsaver

.include <bsd.port.mk>
