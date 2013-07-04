# $MidnightBSD: mports/x11-themes/gnome-themes/Makefile,v 1.11 2011/05/28 06:20:57 laffer1 Exp $

PORTNAME=	gnome-themes
PORTVERSION=	2.32.1
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of themes and icons for GNOME2
LICENSE=	lgpl

BUILD_DEPENDS=	gtk-engines2>=2.15.0:${PORTSDIR}/x11-themes/gtk-engines2 \
		icon-naming-utils>=0.8.7:${PORTSDIR}/x11-themes/icon-naming-utils
RUN_DEPENDS=	gtk-engines2>=2.15.0:${PORTSDIR}/x11-themes/gtk-engines2

CONFLICTS=	clearlooks-metacity-0.*

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix intlhack metacity gtk20
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
