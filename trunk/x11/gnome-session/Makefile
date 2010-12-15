# $MidnightBSD: mports/x11/gnome-session/Makefile,v 1.6 2009/12/13 21:11:40 laffer1 Exp $

PORTNAME=	gnome-session
PORTVERSION=	2.30.2
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	gnome2
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session component for the GNOME 2 desktop
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon
LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		gnome-keyring.0:${PORTSDIR}/security/libgnome-keyring \
		notify.1:${PORTSDIR}/devel/libnotify \
		execinfo:${PORTSDIR}/devel/libexecinfo \
		upower-glib.1:${PORTSDIR}/sysutils/upower
RUN_DEPENDS=	${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon \
    		${LOCALBASE}/sbin/console-kit-daemon:${PORTSDIR}/sysutils/consolekit \
		${LOCALBASE}/bin/xdpyinfo:${PORTSDIR}/x11/xdpyinfo

INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_XORG=	ice sm xau xext xrandr
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2
GNOME_DESKTOP_VERSION=2
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docbook-docs
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gnome-session.1 gnome-wm.1 gnome-session-properties.1 \
		gnome-session-save.1
GCONF_SCHEMAS=	gnome-session.schemas

.include <bsd.port.mk>
