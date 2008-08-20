# New ports collection makefile for:   libgail-gnome
# Date Created:			12 April 2002
# Whom:				Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/libgail-gnome/Makefile,v 1.1 2008/01/01 20:11:30 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/libgail-gnome/Makefile,v 1.45 2007/10/24 23:34:35 marcus Exp $
#   $MCom: ports/x11-toolkits/libgail-gnome/Makefile,v 1.21 2007/09/17 13:13:59 ahze Exp $
#

PORTNAME=	libgail-gnome
PORTVERSION=	1.20.0
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
