# Created by: Gustau Perez <gustau.perez@gmail.com>

PORTNAME=	gnome-clocks
PORTVERSION=	40.0
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clocks for GNOME 3

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	itstool:textproc/itstool \
		vala:lang/vala
LIB_DEPENDS=	libgeoclue-2.so:net/geoclue \
		libgeocode-glib.so:net/geocode-glib \
		libgweather-3.so:net/libgweather \
		libhandy-1.so:x11-toolkits/libhandy

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome localbase meson pkgconfig \
		python:3.4+,build shebangfix tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	cairo gnomedesktop3 gsound
INSTALLS_ICONS=	yes
SHEBANG_FILES=	build-aux/post-install.py

GLIB_SCHEMAS=	org.gnome.clocks.gschema.xml

.include <bsd.port.mk>
