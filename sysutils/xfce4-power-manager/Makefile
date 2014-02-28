# $MidnightBSD$

PORTNAME=	xfce4-power-manager
PORTVERSION=	1.2.0
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Power manager for the Xfce Desktop

LICENSE=	gpl2

LIB_DEPENDS=	notify:${PORTSDIR}/devel/libnotify \
	dbus-glib-1:${PORTSDIR}/devel/dbus-glib \
	polkit-gobject-1:${PORTSDIR}/sysutils/polkit

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USES=		gettext pkgconfig gmake
USE_GNOME=	glib20 gtk20 intltool intlhack
USE_XFCE=	configenv libutil libmenu panel xfconf
INSTALLS_ICONS=	yes
USE_XORG=	xrandr x11 xext
CONFIGURE_ARGS=	--disable-network-manager \
		--enable-polkit

.include <bsd.port.mk>
