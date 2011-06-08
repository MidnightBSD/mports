# $MidnightBSD: mports/sysutils/gnome-system-monitor/Makefile,v 1.4 2011/01/15 02:20:33 laffer1 Exp $
# $FreeBSD: ports/sysutils/gnome-system-monitor/Makefile,v 1.78 2007/05/29 02:31:24 mezz Exp $

PORTNAME=	gnome-system-monitor
PORTVERSION=	2.28.2
PORTREVISION=	0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 system monitor program
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme
LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop \
		gtkmm-2.4.1:${PORTSDIR}/x11-toolkits/gtkmm24
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme

USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack libwnck gnomevfs2 gnomedocutils \
		librsvg2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lutil"

GCONF_SCHEMAS=	gnome-system-monitor.schemas

.include <bsd.port.mk>
