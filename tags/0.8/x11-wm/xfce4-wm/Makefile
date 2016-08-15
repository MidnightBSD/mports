# $MidnightBSD$
# $FreeBSD: ports/x11-wm/xfce4-wm/Makefile,v 1.46 2008/06/06 14:17:21 edwin Exp $

PORTNAME=	xfce4-wm
PORTVERSION=	4.12.3
CATEGORIES=	x11-wm xfce
MASTER_SITES=	XFCE/src/xfce/xfwm4/${PORTVERSION:R}
DISTNAME=	xfwm4-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce window manager

LICENSE=	gpl2

LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib

CONFIGURE_ARGS=	--enable-xsync \
		--enable-render \
		--enable-randr \
		--enable-compositor \
		--disable-kde-systray
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USES=		pkgconfig gmake gettext-tools xfce tar:bzip2
USE_GNOME=	gtk20 intltool intlhack libwnck
USE_LDCONFIG=	yes
USE_XFCE=	libmenu
USE_XORG=	x11 sm xcomposite xdamage xext xfixes xrandr xrender
DATADIR=	${PREFIX}/share/xfwm4

OPTIONS_DEFINE=		DRM NLS STARTUP
OPTIONS_DEFAULT=	NLS STARTUP
DRM_DESC=	Direct Rendering Module service
STARTUP_DESC=	Startup notification
DRM_LIB_DEPENDS=	libdrm.so:${PORTSDIR}/graphics/libdrm
DRM_CONFIGURE_ENABLE=	libdrm
NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls
STARTUP_LIB_DEPENDS=	libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification
STARTUP_CONFIGURE_ENABLE=	startup-notification
OPTIONS_SUB=	yes

.include <bsd.port.mk>
