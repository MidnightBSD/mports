# $MidnightBSD: mports/x11-toolkits/libgail-gnome/Makefile,v 1.2 2008/08/20 17:55:48 laffer1 Exp $

PORTNAME=	libgail-gnome
PORTVERSION=	1.20.1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the ATK interfaces for GNOME widgets
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomeprefix gnomehack gnomepanel atspi
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
PLIST_FILES=	lib/gtk-2.0/modules/libgail-gnome.la \
		lib/gtk-2.0/modules/libgail-gnome.so \
		libdata/pkgconfig/libgail-gnome.pc

.include <bsd.port.mk>
