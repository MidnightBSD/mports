PORTNAME=	compiz
PORTVERSION=	0.8.8
PORTREVISION=	4
CATEGORIES=	x11-wm
MASTER_SITES=	https://BSDforge.com/projects/source/x11-wm/compiz/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiz Composite/Window Manager

LICENSE=	gpl2 lgpl2.1 mit
LICENSE_COMB=	multi

LIB_DEPENDS=	libpng.so:graphics/png \
		libgtop-2.0.so:devel/libgtop \
		libstartup-notification-1.so:x11/startup-notification
RUN_DEPENDS=	glxinfo:graphics/mesa-demos \
		nvidia-settings:x11/nvidia-settings

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gettext gl gmake gnome libtool \
		localbase pathfix tar:bzip2 xorg xorg-cat:app
USE_GL=		gl glu
USE_GNOME=	cairo libxslt intltool
USE_LDCONFIG=	yes
USE_XORG=	ice sm x11 xcomposite xdamage xext xfixes xinerama \
		xorgproto xrandr xrender

CONFIGURE_ARGS=	--disable-kde4 --disable-kde \
		--disable-gconf \
		--disable-gnome \
		--disable-gnome-keybindings \
		--disable-metacity \
		--disable-inotify

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	SVG GTK2 DBUS FUSE
OPTIONS_DEFAULT=	SVG GTK2 DBUS

SUB_FILES=		compiz-manager
DESKTOP_ENTRIES=	"Compiz Manager" \
			"Wrapper script for starting compiz" \
			"" \
			"compiz-manager" \
			"System;Core;" \
			false

OPTIONS_SUB=	yes

DBUS_CONFIGURE_ENABLE=	dbus
DBUS_BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/dbus-1.pc:devel/dbus
DBUS_RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/dbus-1.pc:devel/dbus

FUSE_CONFIGURE_ENABLE=	fuse
FUSE_USES=		fuse

GTK2_CONFIGURE_ENABLE=	gtk
GTK2_USE=	GNOME=glib20,libwnck

SVG_CONFIGURE_ENABLE=	librsvg
SVG_USE=	GNOME=librsvg2

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDBUS} && ${PORT_OPTIONS:MGTK2}
CONFIGURE_ARGS+=	--enable-dbus-glib
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dbus-glib-1.pc:devel/dbus-glib
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dbus-glib-1.pc:devel/dbus-glib
.else
CONFIGURE_ARGS+=	--disable-dbus --disable-dbus-glib
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/compiz-manager ${STAGEDIR}${PREFIX}/bin/compiz-manager

.include <bsd.port.mk>
