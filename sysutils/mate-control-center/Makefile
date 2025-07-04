PORTNAME=	mate-control-center
PORTVERSION=	1.26.0
PORTREVISION=	1
CATEGORIES=	sysutils mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Control center for MATE project

LICENSE=	gpl2 gpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libdbus-1.so:devel/dbus \
		libdbus-glib-1.so:devel/dbus-glib \
		libxklavier.so:x11/libxklavier \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libstartup-notification-1.so:x11/startup-notification \
		libunique-3.0.so:x11-toolkits/libunique3 \
		libpolkit-gobject-1.so:sysutils/polkit \
		libaccountsservice.so:sysutils/accountsservice

PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext gmake gnome libtool localbase mate \
		pathfix pkgconfig shared-mime-info tar:xz xorg
USE_CSTD=	c99
USE_MATE=	desktop libmatekbd marco menus settingsdaemon
USE_XORG=	ice sm x11 xcursor xext xft xi xrandr xscrnsaver
USE_GNOME=	cairo dconf glib20 gtk30 intlhack libxml2 librsvg2 pango
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-appindicator=no \
		--disable-update-mimedb
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.mate.control-center.gschema.xml \
		org.mate.control-center.keybinding.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/capplets/common/mate-theme-info.c
	@${REINPLACE_CMD} -e 's|/usr/sbin|${TRUE_PREFIX}/sbin|g' \
		${WRKSRC}/capplets/display/org.mate.randr.policy.in

.include <bsd.port.mk>
