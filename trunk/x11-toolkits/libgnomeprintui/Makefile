# $MidnightBSD: mports/x11-toolkits/libgnomeprintui/Makefile,v 1.4 2009/06/29 04:24:51 laffer1 Exp $

PORTNAME=	libgnomeprintui
PORTVERSION=	2.18.4
PORTREVISION=	0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome print support library
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme

USE_BZIP2=	yes
USE_XORG=	x11 xpm
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeprint libgnomecanvas \
		intlhack ltverhack
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
USE_BISON=	build
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
