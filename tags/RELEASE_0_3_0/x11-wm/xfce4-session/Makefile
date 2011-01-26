# $MidnightBSD: mports/x11-wm/xfce4-session/Makefile,v 1.3 2009/05/26 01:16:40 laffer1 Exp $

PORTNAME=	xfce4-session
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session manager for the Xfce 4 desktop environment
LICENSE=	lgpl

BUILD_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth \
		dbus-glib>=0.73:${PORTSDIR}/devel/dbus-glib
RUN_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth \
		dbus-glib>=0.73:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget gtk20 intltool intlhack pkgconfig libwnck
USE_LDCONFIG=	yes
USE_XFCE=	configenv libgui libutil xfconf
USE_XORG=	x11 sm ice

MAN1=		xfce4-session.1 xfce4-session-logout.1

.include <bsd.port.mk>
