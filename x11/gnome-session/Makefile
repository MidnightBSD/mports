# New ports collection makefile for:	gnomesession
# Date created:				08 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-session/Makefile,v 1.4 2008/06/13 14:49:39 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-session/Makefile,v 1.56 2007/07/03 16:57:27 mezz Exp $
#   $MCom: ports/x11/gnome-session/Makefile,v 1.110 2007/03/18 20:55:55 marcus Exp $
#

PORTNAME=	gnome-session
PORTVERSION=	2.22.3
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
		gnome-keyring.0:${PORTSDIR}/security/gnome-keyring \
		notify.1:${PORTSDIR}/devel/libnotify
RUN_DEPENDS=	${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon \
		${LOCALBASE}/bin/xdpyinfo:${PORTSDIR}/x11/xdpyinfo

INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_XORG=	xau xrandr
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui
GNOME_DESKTOP_VERSION=2
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gnome-session.1 gnome-wm.1 session-properties.1 \
		gnome-session-save.1
MAN5=		default.session.5
GCONF_SCHEMAS=	gnome-session.schemas

.include <bsd.port.mk>
