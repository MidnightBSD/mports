PORTNAME=	khtml
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	www kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 KTHML rendering engine

LIB_DEPENDS=	libgif.so:graphics/giflib \
		libpng.so:graphics/png

USES=		cmake compiler:c++11-lib gettext gperf jpeg kde:5 \
		qt:5 tar:xz xorg
USE_KDE=	archive auth bookmarks codecs completion config \
		configwidgets coreaddons globalaccel i18n iconthemes \
		jobwidgets js kio notifications parts phonon service solid sonnet \
		textwidgets wallet widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		concurrent core dbus gui network \
		printsupport widgets x11extras xml \
		buildtools:build qmake:build
USE_XORG=	ice sm x11 xext

.include <bsd.port.mk>
