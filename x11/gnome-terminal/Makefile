# $MidnightBSD: mports/x11/gnome-terminal/Makefile,v 1.6 2009/10/31 23:55:27 laffer1 Exp $

PORTNAME=	gnome-terminal
PORTVERSION=	2.30.2
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal component for the GNOME 2 Desktop
LICENSE=	gpl2

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification

USE_GETTEXT=	yes
USE_BZIP2=	yes
INSTALLS_OMF=	yes
USE_GMAKE=	yes
USE_XORG=	sm
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 vte gnomedocutils \
		libgnome
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-terminal.schemas

post-configure:
		@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

.include <bsd.port.mk>
