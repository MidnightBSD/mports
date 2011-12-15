# New ports collection makefile for:	xfdesktop
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11-wm/xfce4-desktop/Makefile,v 1.4 2011/02/09 13:25:21 laffer1 Exp $
# $FreeBSD: ports/x11-wm/xfce4-desktop/Makefile,v 1.46 2008/06/06 14:17:20 edwin Exp $
#

PORTNAME=	xfce4-desktop
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfdesktop-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 desktop background manager and root menu
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20  gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv libgui libmenu libutil panel xfconf

OPTIONS=	FAM	"Enable FAM support"		on \
		THUNAR	"Enable thunar support"		on

MAN1=		xfdesktop.1

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_THUNAR)
CONFIGURE_ARGS+=--enable-thunar-vfs --enable-thunarx --enable-exo
USE_XFCE+=	libexo thunar
.else
CONFIGURE_ARGS+=--disable-thunar-vfs --disable-thunarx --disable-exo
.endif

.if !defined(WITHOUT_FAM)
.else
.endif

.include <bsd.port.post.mk>
