PORTNAME=	libksysguard
DISTVERSION=	${KDE_PLASMA_VERSION}
CATEGORIES=	sysutils kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plasma5 library to track and control running processes
WWW=		https://www.kde.org/plasma-desktop

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz xorg
USE_KDE=	auth codecs completion config configwidgets coreaddons \
		globalaccel i18n iconthemes jobwidgets kio newstuff package \
		service solid widgetsaddons windowsystem \
		ecm:build
USE_QT=		concurrent core dbus declarative gui location network \
		printsupport webchannel widgets x11extras xml \
		buildtools:build qmake:build

USE_XORG=	ice sm x11 xext xres

OPTIONS_DEFINE=	WEBENGINE

WEBENGINE_USE=	QT=webengine
WEBENGINE_DESC=	HTML-based GUI ksysguard library based on Qt5WebEngine
WEBENGINE_CMAKE_BOOL_OFF=	CMAKE_DISABLE_FIND_PACKAGE_Qt5WebEngineWidgets

.include <bsd.port.mk>
