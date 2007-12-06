# New ports collection makefile for:	notification-daemon
# Date created:				2005-08-06
# Whom:					Andreas Kohn <andreas@syndrom23.de>
#
# $MidnightBSD$
# $FreeBSD: ports/deskutils/notification-daemon/Makefile,v 1.22 2007/05/19 20:01:48 flz Exp $
#

PORTNAME=	notification-daemon
PORTVERSION=	0.3.7
MASTER_SITES=	http://www.galago-project.org/files/releases/source/notification-daemon/

MAINTAINER=	ports@MindightBSD.org
COMMENT=	Send small notifications to your desktop

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		sexy:${PORTSDIR}/x11-toolkits/libsexy

USE_GNOME=	gnomehack gnomeprefix gnometarget intlhack gconf2 libwnck
USE_GMAKE=	yes
USE_XLIB=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-dbus-services=${PREFIX}/share/dbus-1/services
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	notification-daemon.schemas

.include <bsd.port.mk>
