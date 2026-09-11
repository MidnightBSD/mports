PORTNAME=	gnome-settings-daemon
PORTVERSION=	47.2
PORTREVISION=	0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME settings daemon
WWW=		https://www.gnome.org/

LICENSE=	gpl2+ lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libcanberra.so:audio/libcanberra \
		libcolord.so:graphics/colord \
		libcups.so:print/cups \
		libfontconfig.so:x11-fonts/fontconfig \
		libgeoclue-2.so:net/geoclue \
		libgeocode-glib-2.so:net/geocode-glib2 \
		libgcr-4.so:security/gcr \
		libgweather-4.so:net/libgweather4 \
		liblcms2.so:graphics/lcms2 \
		libnotify.so:devel/libnotify \
		libnspr4.so:devel/nspr \
		libnss3.so:security/nss \
		libp11-kit.so:security/p11-kit \
		libpolkit-gobject-1.so:sysutils/polkit \
		libpulse.so:audio/pulseaudio \
		libupower-glib.so:sysutils/upower
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dbusmock>0:devel/py-python-dbusmock@${PY_FLAVOR}

PORTSCOUT=	limitw:1,even

USE_XORG=	x11 xext xfixes xi xtst
USE_GNOME=	cairo glib20 gnomedesktop3 gtk30
USES=		gettext gnome localbase:ldflags meson perl5 pkgconfig shebangfix \
		python:build tar:xz xorg
USE_PERL5=	build
INSTALLS_ICONS=	yes
MESON_ARGS=	-Dalsa=false \
		-Dcups=true \
		-Dnetwork_manager=false \
		-Drfkill=false \
		-Dsmartcard=true \
		-Dsystemd=false \
		-Dusb-protection=false \
		-Dwwan=false
BINARY_ALIAS=	python3=${PYTHON_VERSION}
SHEBANG_FILES=	plugins/power/test.py \
		plugins/xsettings/test.py

# wayland doesn't build yet, undefined symbol
MESON_ARGS+=	-Dgudev=false \
		-Dwayland=false
#WAYLAND_MESON_TRUE=	wayland gudev
#WAYLAND_LIB_DEPENDS=	libgudev-1.0.so:devel/libgudev \
#			libwayland-client.so:graphics/wayland

GLIB_SCHEMAS=	org.gnome.settings-daemon.enums.xml \
		org.gnome.settings-daemon.peripherals.gschema.xml \
		org.gnome.settings-daemon.peripherals.wacom.gschema.xml \
		org.gnome.settings-daemon.plugins.color.gschema.xml \
		org.gnome.settings-daemon.plugins.gschema.xml \
		org.gnome.settings-daemon.plugins.housekeeping.gschema.xml \
		org.gnome.settings-daemon.plugins.media-keys.gschema.xml \
		org.gnome.settings-daemon.plugins.power.gschema.xml \
		org.gnome.settings-daemon.plugins.power.gschema.xml.override \
		org.gnome.settings-daemon.plugins.sharing.gschema.xml \
		org.gnome.settings-daemon.plugins.xsettings.gschema.xml

post-install:
	${INSTALL_DATA} ${FILESDIR}/org.gnome.settings-daemon.plugins.power.gschema.xml.override \
		${PREFIX}/share/glib-2.0/schemas/

.include <bsd.port.mk>
