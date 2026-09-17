PORTNAME=	mutter
PORTVERSION=	49.7
PORTREVISION=	0
CATEGORIES=	x11-wm
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window and compositing manager based on Clutter
WWW=		https://gnome.pages.gitlab.gnome.org/mutter/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto \
		gnome-settings-daemon>0:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		py-argcomplete>0:devel/py-argcomplete \
		xkeyboard-config>0:x11/xkeyboard-config \
		dbus>0:devel/dbus
LIB_DEPENDS=	libcanberra.so:audio/libcanberra \
		libglycin-2.so:graphics/glycin2 \
		libgudev-1.0.so:devel/libgudev \
		libdrm.so:graphics/libdrm \
		libinput.so:x11/libinput \
		libfribidi.so:converters/fribidi \
		libgraphene-1.0.so:graphics/graphene \
		libpipewire-0.3.so:multimedia/pipewire \
		libstartup-notification-1.so:x11/startup-notification \
		libxkbcommon.so:x11/libxkbcommon \
		liblcms2.so:graphics/lcms2 \
		libcolord.so:graphics/colord \
		libharfbuzz.so:print/harfbuzz \
		libei.so:x11/libei \
		libdisplay-info.so:sysutils/libdisplay-info
RUN_DEPENDS=	gnome-settings-daemon>0:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		xkeyboard-config>0:x11/xkeyboard-config

USES=		compiler:c++0x gettext-tools gl gnome localbase meson \
		pkgconfig tar:xz xorg
USE_GL=		egl gbm
USE_GNOME=	atk cairo gdkpixbuf gnomedesktop4 gtk40 introspection:build
USE_XORG=	ice pixman sm x11 xcb xcomposite xcursor xdamage xext \
		xfixes xi xinerama xkbfile xrandr xrender xtst
USE_LDCONFIG=	yes

PORTSCOUT=	limit:^49\.

CFLAGS+=	-Wno-unknown-warning-option -Wno-format-nonliteral
CFLAGS+=	-I${LOCALBASE}/include/gudev-1.0
CFLAGS+=	-I${LOCALBASE}/include/glycin-2
CPPFLAGS+=	-fno-omit-frame-pointer
MESON_ARGS=	-Dlibwacom=false \
		-Dnative_backend=false \
		-Dlogind=false \
		-Dudev=false \
		-Ddevkit=disabled \
		-Dprofiler=false \
		-Dtests=disabled \
		-Dcogl_tests=false \
		-Dclutter_tests=false \
		-Dmutter_tests=false \
		-Dinstalled_tests=false

GLIB_SCHEMAS=	org.gnome.mutter.gschema.xml \
		org.gnome.mutter.wayland.gschema.xml

OPTIONS_DEFINE=	WAYLAND
OPTIONS_DEFAULT=	WAYLAND
OPTIONS_SUB=	yes

WAYLAND_BUILD_DEPENDS=	wayland-protocols>0:graphics/wayland-protocols \
			xwayland>0:x11-servers/xwayland
WAYLAND_LIB_DEPENDS=	libwayland-server.so:graphics/wayland
WAYLAND_RUN_DEPENDS=	xwayland>0:x11-servers/xwayland
WAYLAND_USE=	XORG=xau
WAYLAND_MESON_TRUE=	wayland \
			xwayland

.include <bsd.port.mk>
