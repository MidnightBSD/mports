# $MidnightBSD: mports/x11/gnome-terminal/Makefile,v 1.5 2008/09/21 19:39:37 laffer1 Exp $

PORTNAME=	gnome-terminal
PORTVERSION=	2.26.3.1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal component for the GNOME 2 Desktop
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_BZIP2=	yes
INSTALLS_OMF=	yes
USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui vte gnomedocutils
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-terminal.schemas

post-patch:
	@${TOUCH} -f ${WRKSRC}/aclocal.m4

.include <bsd.port.mk>
