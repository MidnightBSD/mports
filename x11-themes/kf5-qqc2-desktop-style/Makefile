PORTNAME=	qqc2-desktop-style
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
KDE_FRAMEWORKS_VERSION=	5.116.1
CATEGORIES=	x11-themes kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt QuickControl2 style for KDE

USES=		cmake compiler:c++11-lang kde:5 pkgconfig qt:5 tar:xz
USE_KDE=	auth codecs config configwidgets coreaddons iconthemes \
		kirigami2 sonnet widgetsaddons \
		ecm:build
USE_QT=		core dbus declarative gui network widgets xml \
		buildtools:build qmake:build

.include <bsd.port.mk>
