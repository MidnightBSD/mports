PORTNAME=	kiconthemes
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-themes kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library for handling icons in applications

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz
USE_KDE=	archive auth codecs config configwidgets coreaddons \
		i18n widgetsaddons \
		ecm:build
USE_QT=		core dbus gui svg widgets xml \
		buildtools:build qmake:build

OPTIONS_DEFINE=	ICONS
OPTIONS_DEFAULT=	ICONS
ICONS_DESC=	Install Breeze Icons
ICONS_USE=	KDE=breeze-icons:run

.include <bsd.port.mk>
