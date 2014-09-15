# $MidnightBSD$

PORTNAME=	gnome-session
PORTVERSION=	2.32.1
PORTREVISION=	2
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session component for the GNOME 2 desktop

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon
LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring \
		libnotify.so:${PORTSDIR}/devel/libnotify \
		libupower-glib.so:${PORTSDIR}/sysutils/upower
RUN_DEPENDS=	${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon \
    		${LOCALBASE}/sbin/console-kit-daemon:${PORTSDIR}/sysutils/consolekit \
		${LOCALBASE}/bin/xdpyinfo:${PORTSDIR}/x11/xdpyinfo

INSTALLS_ICONS=	yes
USES=		execinfo gettext gmake pathfix pkgconfig tar:bzip2
USE_XORG=	ice sm xau xrandr
USE_GNOME=	gnomeprefix intlhack gconf2
GNOME_DESKTOP_VERSION=2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docbook-docs
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gnome-session.schemas

.include <bsd.port.mk>
