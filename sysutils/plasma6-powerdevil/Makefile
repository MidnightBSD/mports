PORTNAME=	powerdevil
DISTVERSION=	${KDE_PLASMA_VERSION}
CATEGORIES=	sysutils kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manages the power consumption settings of a Plasma shell

LIB_DEPENDS=	libudev.so:devel/libudev-devd \
		libxkbcommon.so:x11/libxkbcommon
RUN_DEPENDS=	${LOCALBASE}/libexec/upowerd:sysutils/upower

USES=		cmake gettext gl kde:6 qt:6 tar:xz xorg
USE_GL=		gl opengl
USE_KDE=	activities auth colorscheme completion config configwidgets \
		coreaddons crash dbusaddons doctools globalaccel i18n idletime \
		itemmodels jobwidgets kcmutils kio kirigami2 layer-shell-qt \
		libkscreen notifications notifyconfig plasma-workspace service \
		solid widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		base declarative
USE_XORG=	x11 xcb

.include <bsd.port.mk>
