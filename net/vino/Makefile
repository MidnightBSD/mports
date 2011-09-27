# $FreeBSD: ports/net/vino/Makefile,v 1.28 2008/05/29 22:04:10 marcus Exp $
# $MidnightBSD: mports/net/vino/Makefile,v 1.1 2008/06/08 21:26:34 crash Exp $

PORTNAME=	vino
PORTVERSION=	2.32.2
PORTREVISION=	0
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server that allows for remote access to your GNOME desktop
LICENSE=        gpl2       

LIB_DEPENDS=	gnutls:${PORTSDIR}/security/gnutls \
		telepathy-glib.0:${PORTSDIR}/net-im/telepathy-glib \
 		unique-1.0.2:${PORTSDIR}/x11-toolkits/unique

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gnomepanel
USE_XORG=	xtst
USE_GMAKE=	yes
GNOME_DESKTOP_VERSION=2
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	vino-server.schemas

.if !defined(WITHOUT_NOTIFY)
LIB_DEPENDS+=	notify.1:${PORTSDIR}/devel/libnotify
CONFIGURE_ARGS+=--enable-libnotify=yes
.else
CONFIGURE_ARGS+=--enable-libnotify=no
.endif

.include <bsd.port.mk>
