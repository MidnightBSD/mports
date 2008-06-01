# New ports collection makefile for:	gnomesession
# Date created:				08 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-session/Makefile,v 1.2 2008/03/30 21:57:10 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-session/Makefile,v 1.56 2007/07/03 16:57:27 mezz Exp $
#   $MCom: ports/x11/gnome-session/Makefile,v 1.110 2007/03/18 20:55:55 marcus Exp $
#

PORTNAME=	gnome-session
PORTVERSION=	2.22.1.1
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME} \
		http://www.marcuscom.com/downloads/:local
MASTER_SITE_SUBDIR=	sources/gnome-session/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${SPLASHES}:local
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
		LDFLAGS="-L${LOCALBASE}/lib" \
		ESD_SERVER="${LOCALBASE}/bin/esd"

MAN1=		gnome-session.1 gnome-wm.1 session-properties.1 \
		gnome-session-save.1
MAN5=		default.session.5
GCONF_SCHEMAS=	gnome-session.schemas

SPLASHES=	freebsd-splashes-gnome-2.18_1.tar

post-extract:
	cd ${WRKDIR} && ${TAR} xf ${DISTDIR}/${DIST_SUBDIR}/${SPLASHES}

post-install:
	${INSTALL_DATA} ${WRKSRC}/data/gnome-splash.png \
		${PREFIX}/share/pixmaps/splash/original-gnome-splash.png
.for splash in MaMBaNgGaoX-2.12.png adamw-piggy-2.12.png adamw-trophy-2.12.png andreas-slogan-2.12.png andreas-splash-2.12.png domix-splash-2.12.png domix-splash2-2.12.png mumija-2.12.png mumija2-2.12.png mumija3-2.12.png tremulant-2.12.png tremulant-blood-2.12.png tremulant-brushed-metal-2.12.png franz-splash_218.png adamw-bat-2.18.jpg adamw-conky-2.18.png adamw-cow-2.18.png adamw-mouth-2.18.png adamw-swing-2.18.png
.endfor

.include <bsd.port.mk>
