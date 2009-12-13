# $MidnightBSD: mports/x11-themes/gnome-themes/Makefile,v 1.5 2009/09/20 02:34:55 smultron Exp $

PORTNAME=	gnome-themes
PORTVERSION=	2.26.3.1
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of themes and icons for GNOME2
LICENSE=	lgpl

BUILD_DEPENDS=	gtk-engines2>=2.9.0:${PORTSDIR}/x11-themes/gtk-engines2 \
		icon-naming-utils>=0.8.0:${PORTSDIR}/x11-themes/icon-naming-utils
RUN_DEPENDS=	gtk-engines2>=2.9.0:${PORTSDIR}/x11-themes/gtk-engines2

CONFLICTS=	clearlooks-metacity-0.*

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:22
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix intlhack metacity libgnomeui
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
