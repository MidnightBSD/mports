# New ports collection makefile for:	gnomesystemmonitor
# Date created:				09 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/gnome-system-monitor/Makefile,v 1.1 2007/10/23 18:58:47 laffer1 Exp $
# $FreeBSD: ports/sysutils/gnome-system-monitor/Makefile,v 1.78 2007/05/29 02:31:24 mezz Exp $
#   $MCom: ports/sysutils/gnome-system-monitor/Makefile,v 1.95 2007/03/12 23:11:28 marcus Exp $
#

PORTNAME=	gnome-system-monitor
PORTVERSION=	2.20.2
CATEGORIES=	sysutils gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gnome-system-monitor/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gnome-system-monitor-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 system monitor program

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme
LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop \
    		pcre.0:${PORTSDIR}/devel/pcre \
		gtkmm-2.4.1:${PORTSDIR}/x11-toolkits/gtkmm24
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
INSTALLS_OMF=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack libwnck gnomevfs2 gnomedocutils
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-pcrecpp
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lutil"

GCONF_SCHEMAS=	gnome-system-monitor.schemas

.include <bsd.port.mk>
