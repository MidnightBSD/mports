# $MidnightBSD: mports/x11-wm/xfce4-session/Makefile,v 1.5 2011/02/09 13:25:21 laffer1 Exp $

PORTNAME=	xfce4-session
PORTVERSION=	4.6.2
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session manager for the Xfce 4 desktop environment
LICENSE=	lgpl

BUILD_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth
RUN_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth
LIB_DEPENDS=	wnck-1.22:${PORTSDIR}/x11-toolkits/libwnck \
		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack  gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv libgui libutil xfconf
USE_XORG=	x11 sm ice

MAN1=		xfce4-session.1 xfce4-session-logout.1

PLIST_SUB=	VERSION="${PORTVERSION:R}"

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
