# New ports collection makefile for:	xfce4-panel
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11-wm/xfce4-panel/Makefile,v 1.3 2009/03/12 03:49:10 ctriv Exp $
# $FreeBSD: ports/x11-wm/xfce4-panel/Makefile,v 1.46 2008/06/06 14:17:21 edwin Exp $
#

PORTNAME=	xfce4-panel
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 panel module
LICENSE=	lgpl

CONFLICTS=	xfce4-systray-*
GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget gtk20 intltool intlhack pkgconfig libwnck
USE_LDCONFIG=	yes
USE_XFCE=	configenv libexo libgui libutil xfconf

OPTIONS=	STARTUP "Enable startup notification support"	on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_STARTUP)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

.include <bsd.port.post.mk>
