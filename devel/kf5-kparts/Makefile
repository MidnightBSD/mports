PORTNAME=	kparts
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 document centric plugin system

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz xorg
USE_KDE=	auth codecs completion config configwidgets coreaddons \
		i18n iconthemes jobwidgets kio service \
		solid textwidgets widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		concurrent core dbus gui network widgets xml \
		buildtools:build qmake:build
USE_XORG=	x11

.include <bsd.port.mk>
