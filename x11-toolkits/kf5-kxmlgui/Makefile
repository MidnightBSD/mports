PORTNAME=	kxmlgui
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 user configurable main windows

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz
USE_KDE=	auth codecs config configwidgets coreaddons \
		globalaccel guiaddons i18n iconthemes itemviews \
		widgetsaddons \
		ecm:build
USE_QT=		core dbus gui network printsupport widgets xml \
		buildtools:build qmake:build

.include <bsd.port.mk>
