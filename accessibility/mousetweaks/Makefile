# $MidnightBSD: mports/accessibility/mousetweaks/Makefile,v 1.1 2010/09/06 19:45:32 laffer1 Exp $

PORTNAME=	mousetweaks
PORTVERSION=	2.32.1
CATEGORIES=	accessibility
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mouse accessibility enhancements for the GNOME desktop
LICENSE=	gpl3

USE_XORG=	x11 xfixes xcursor xtst
USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gnomepanel intlhack
USE_GMAKE=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	mousetweaks.schemas pointer-capture-applet.schemas
MAN1=		dwell-click-applet.1 mousetweaks.1 pointer-capture-applet.1

.include <bsd.port.mk>
