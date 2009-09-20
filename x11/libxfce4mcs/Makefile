# New ports collection makefile for:	libxfce4util
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11/libxfce4mcs/Makefile,v 1.1 2008/09/25 02:39:54 laffer1 Exp $
# $FreeBSD: ports/x11/libxfce4mcs/Makefile,v 1.37 2008/06/06 14:09:04 edwin Exp $
#

PORTNAME=	libxfce4mcs
PORTVERSION=	4.4.2
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 settings management library used by most XFce 4 modules
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack gnometarget pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv libutil

OPTIONS=	GTKDOC	"install the library documentation"	off \
		STARTUP "Enable startup notification support"	on

.include <bsd.port.pre.mk>

.if defined(WITH_GTKDOC)
BUILD_DEPENDS+=	gtkdocize:${PORTSDIR}/textproc/gtk-doc
CONFIGURE_ARGS+=--enable-gtk-doc
PLIST_SUB+=	GTK_DOC=""
.else
CONFIGURE_ARGS+=--disable-gtk-doc
PLIST_SUB+=	GTK_DOC="@comment "
.endif

.if !defined(WITHOUT_STARTUP)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

.include <bsd.port.post.mk>
