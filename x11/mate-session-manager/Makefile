PORTNAME=	mate-session-manager
PORTVERSION=	1.28.0
PORTREVISION=	1
CATEGORIES=	x11 mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session component for the MATE desktop
WWW=		https://mate-desktop.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdbus-glib-1.so:devel/dbus-glib \
		libdbus-1.so:devel/dbus \
		libupower-glib.so:sysutils/upower
RUN_DEPENDS=	${LOCALBASE}/sbin/console-kit-daemon:sysutils/consolekit2 \
		${LOCALBASE}/bin/xdpyinfo:x11/xdpyinfo

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome libtool localbase mate pathfix pkgconfig \
		tar:xz xorg
USE_MATE=	desktop
USE_XORG=	ice sm x11 xau xext xrandr xrender xtrans xtst
USE_GNOME=	cairo gtk30 intlhack librsvg2 libxslt pango
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docbook-docs \
		--with-default-wm=mate-wm \
		--enable-upower \
		--with-systemd=no
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.mate.session.gschema.xml

.include <bsd.port.mk>
