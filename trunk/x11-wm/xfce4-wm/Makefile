# New ports collection makefile for:	xfwm4
# Date created:		August 14, 2002
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11-wm/xfce4-wm/Makefile,v 1.4 2011/12/15 00:57:58 laffer1 Exp $
# $FreeBSD: ports/x11-wm/xfce4-wm/Makefile,v 1.46 2008/06/06 14:17:21 edwin Exp $
#

PORTNAME=	xfce4-wm
PORTVERSION=	4.8.3
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/xfwm4/${PORTVERSION:R}
DISTNAME=	xfwm4-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 window manager
LICENSE=	gpl2

DATADIR=	${PREFIX}/share/xfwm4
DOCSDIR=	${PREFIX}/share/doc/xfwm4

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		wnck-1.22:${PORTSDIR}/x11-toolkits/libwnck

CONFIGURE_ARGS=	--enable-xsync \
		--enable-render \
		--enable-randr \
		--disable-kde-systray
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gtk20 intltool intlhack pkgconfig desktopfileutils
USE_LDCONFIG=	yes
USE_XFCE=	configenv libmenu libutil xfconf
USE_XORG=	x11 sm xext xrandr xrender

OPTIONS=	COMPOSITE	"Support the experimental X11 Composite extension"	on \
		STARTUP 	"Enable startup notification support"			on \
		REVMOUSE	"Reverse mouse workspace changing direction"		off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_COMPOSITE)
CONFIGURE_ARGS+=--enable-compositor
.else
CONFIGURE_ARGS+=--disable-compositor
.endif

.if !defined(WITHOUT_STARTUP)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

.if defined(WITH_REVMOUSE)
EXTRA_PATCHES=	${FILESDIR}/extrapatch-src__events.c
.endif

.include <bsd.port.post.mk>
