PORTNAME=	krfb
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	net kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server for KDE
WWW=		https://www.kde.org

BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto
LIB_DEPENDS=	libvncserver.so:net/libvncserver \
		libxcb-image.so:x11/xcb-util-image

USES=		alias cmake compiler:c++11-lib gettext jpeg kde:6 pkgconfig \
		qt:6 tar:xz xorg
USE_KDE=	auth codecs completion config configwidgets coreaddons crash \
		dbusaddons dnssd doctools i18n notifications \
		statusnotifieritem wallet wayland widgetsaddons windowsystem \
		xmlgui \
		ecm:build plasma-wayland-protocols:build
USE_QT=		base
USE_XORG=	x11 xcb xdamage xext xtst

OPTIONS_DEFINE=			DOCS PIPEWIRE
OPTIONS_DEFAULT=		PIPEWIRE
OPTIONS_SUB=			yes
PIPEWIRE_DESC=			Screen capture via PipeWire
PIPEWIRE_LIB_DEPENDS=		libpipewire-0.3.so:multimedia/pipewire
PIPEWIRE_USE=			KDE=kpipewire
PIPEWIRE_CMAKE_BOOL_OFF=	DISABLE_PIPEWIRE

.include <bsd.port.mk>
