PORTNAME=	kconfigwidgets
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 widgets for configuration dialogs

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 shebangfix tar:xz
USE_KDE=	auth codecs config coreaddons guiaddons \
		i18n widgetsaddons \
		doctools:build ecm:build
USE_QT=		core dbus gui widgets xml \
		buildtools:build qmake:build

SHEBANG_FILES=	src/preparetips5

.include <bsd.port.mk>
