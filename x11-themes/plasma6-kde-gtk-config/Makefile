PORTNAME=	kde-gtk-config
DISTVERSION=	${KDE_PLASMA_VERSION}
CATEGORIES=	x11-themes kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Syncs KDE settings to GTK applications

BUILD_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas \
		sassc:textproc/sassc
LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz
RUN_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas \
		xsettingsd:x11/xsettingsd

USES=		cmake gl gnome kde:6 pkgconfig qt:6 tar:xz xorg
USE_GL=		gl opengl
USE_XORG=	x11
USE_GNOME=	cairo gdkpixbuf glib20 gtk20 gtk30
USE_KDE=	colorscheme config configwidgets coreaddons dbusaddons \
		decoration guiaddons widgetsaddons windowsystem \
		ecm:build
USE_QT=		base svg

.include <bsd.port.mk>
