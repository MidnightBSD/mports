PORTNAME=	gnome-control-center
PORTVERSION=	43.2
PORTREVISION=	6
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Control center for GNOME desktop
WWW=		https://www.gnome.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gnome-settings-daemon>=3.4.0:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>=3.2.2:devel/gsettings-desktop-schemas # #		docbook-xsl>=0:textproc/docbook-xsl
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice \
		libadwaita-1.so:x11-toolkits/libadwaita \
		libcolord-gtk.so:graphics/colord-gtk \
		libcolord.so:graphics/colord \
		libcups.so:print/cups \
		libepoxy.so:graphics/libepoxy \
		libfontconfig.so:x11-fonts/fontconfig \
		libgoa-1.0.so:net/gnome-online-accounts \
		libgtop-2.0.so:devel/libgtop \
		libibus-1.0.so:textproc/ibus \
		libpolkit-gobject-1.so:sysutils/polkit \
		libpulse.so:audio/pulseaudio \
		libpwquality.so:security/libpwquality \
		libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup \
		libudisks2.so:sysutils/libudisks \
		libupower-glib.so:sysutils/upower
RUN_DEPENDS=	cantarell-fonts>=0:x11-fonts/cantarell-fonts \
		gnome-settings-daemon>=3.4.0:sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>=3.2.2:devel/gsettings-desktop-schemas

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lib gettext gnome gstreamer localbase:ldflags meson \
		pkgconfig python:build samba:lib tar:xz xorg
USE_GNOME=	cairo gnomedesktop3 gsound libxml2
USE_XORG=	x11 xi
USE_LDCONFIG=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.Settings.gschema.xml

OPTIONS_SUB=	yes

OPTIONS_DEFINE=		WAYLAND
OPTIONS_DEFAULT=	WAYLAND

WAYLAND_MESON_TRUE=	wayland
WAYLAND_LIB_DEPENDS=	libgudev-1.0.so:devel/libgudev

.include <bsd.port.mk>
