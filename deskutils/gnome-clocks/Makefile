PORTNAME=	gnome-clocks
PORTVERSION=	47.0
PORTEPOCH=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clocks for GNOME
WWW=		https://wiki.gnome.org/Apps/Clocks

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	itstool:textproc/itstool \
		update-desktop-database:devel/desktop-file-utils
LIB_DEPENDS=	libgeoclue-2.so:net/geoclue \
		libgeocode-glib-2.so:net/geocode-glib2 \
		libgweather-4.so:net/libgweather4

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome localbase meson pkgconfig \
		shebangfix tar:xz vala:build
USE_LDCONFIG=	yes
USE_GNOME=	gtk40 libadwaita gnomedesktop3
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.clocks.gschema.xml

.include <bsd.port.mk>
