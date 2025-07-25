PORTNAME=	mate-panel
PORTVERSION=	1.28.4
PORTEPOCH=	1
CATEGORIES=	x11 mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Panel component for the MATE Desktop
WWW=		https://mate-desktop.org/

LICENSE=	gfdl gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_gfdl=	${WRKSRC}/COPYING-DOCS
LICENSE_FILE_lgpl2.1 =	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libdbus-glib-1.so:devel/dbus-glib \
		libstartup-notification-1.so:x11/startup-notification

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome libtool localbase mate pathfix pkgconfig \
		tar:xz xorg
USE_CSTD=	c99
USE_MATE=	desktop libmateweather menus
USE_XORG=	ice sm
USE_GNOME=	cairo dconf gnomeprefix gtk30 intltool \
		introspection:build librsvg2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.mate.panel.applet.clock.gschema.xml \
		org.mate.panel.applet.fish.gschema.xml \
		org.mate.panel.enums.xml \
		org.mate.panel.gschema.xml \
		org.mate.panel.menubar.gschema.xml \
		org.mate.panel.object.gschema.xml \
		org.mate.panel.toplevel.gschema.xml

OPTIONS_DEFINE=	DOCS
OPTIONS_MULTI=	GUI
OPTIONS_MULTI_GUI=	WAYLAND X11
OPTIONS_DEFAULT=	WAYLAND X11
OPTIONS_SUB=	yes

WAYLAND_LIB_DEPENDS=		libgtk-layer-shell.so:x11-toolkits/gtk-layer-shell
WAYLAND_CONFIGURE_ENABLE=	wayland

X11_USE= 			GNOME=libwnck3 XORG=x11,xau,xrandr
X11_CONFIGURE_ENABLE=		x11
X11_VARS=			GLIB_SCHEMAS+=org.mate.panel.applet.notification-area.gschema.xml \
				GLIB_SCHEMAS+=org.mate.panel.applet.window-list.gschema.xml \
				GLIB_SCHEMAS+=org.mate.panel.applet.workspace-switcher.gschema.xml \
				GLIB_SCHEMAS+=org.mate.panel.applet.window-list-previews.gschema.xml
X11_CONFIGURE_ENV_OFF=		WNCKLET_CFLAGS=" " WNCKLET_LIBS=" " \
				XRANDR_CFLAGS=" " XRANDR_LIBS=" "

.include <bsd.port.mk>
