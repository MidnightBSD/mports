PORTNAME=	knotifications
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 abstraction for system notifications

LIB_DEPENDS=	libdbusmenu-qt5.so:devel/libdbusmenu-qt@qt5 \
		libcanberra.so:audio/libcanberra

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz xorg
USE_KDE=	config coreaddons windowsystem \
		ecm:build
USE_QT=		core dbus declarative gui linguisttools network widgets x11extras \
		buildtools:build qmake:build
USE_XORG=	x11 xtst

OPTIONS_DEFINE=		AUDIO
OPTIONS_DEFAULT=	AUDIO

AUDIO_DESC=		Audio notifications/text-to-speech support
AUDIO_LIB_DEPENDS=	libcanberra-gtk3.so:audio/libcanberra-gtk3
AUDIO_USE=		QT=speech
AUDIO_USES=		pkgconfig

.include <bsd.port.mk>
