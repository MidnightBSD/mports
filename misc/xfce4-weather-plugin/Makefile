# New ports collection makefile for:	xfce4-weather-plugin
# Date created:		04 April 2004
# Whom:			Filippo Natali <filippo@widestore.net>
#
# $MidnightBSD: mports/misc/xfce4-weather-plugin/Makefile,v 1.3 2011/02/09 13:32:19 laffer1 Exp $
# $FreeBSD: ports/misc/xfce4-weather-plugin/Makefile,v 1.27 2008/06/06 13:45:39 edwin Exp $
#

PORTNAME=	xfce4-weather-plugin
PORTVERSION=	0.7.3
PORTREVISION=	0
CATEGORIES=	misc xfce geography
MASTER_SITES=	http://archive.xfce.org/src/panel-plugins/xfce4-weather-plugin/0.7/
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 weather module for xfce4-panel
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	 glib20 gtk20 intltool intlhack libxml2 pkgconfig
USE_XFCE=	configenv libgui libutil panel

.include <bsd.port.mk>
