PORTNAME=	gnome-maps
DISTVERSION=	50.5
PORTREVISION=	0
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Map application for GNOME
WWW=		https://apps.gnome.org/Maps/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	blueprint-compiler:devel/blueprint-compiler \
		geoclue>=0:net/geoclue
LIB_DEPENDS=	libgeocode-glib-2.so:net/geocode-glib2 \
		libgjs.so:lang/gjs \
		libgweather-4.so:net/libgweather4 \
		librest-1.0.so:net/librest1 \
		libshumate-1.0.so:x11-toolkits/libshumate \
		libsoup-3.0.so:devel/libsoup3 \
		libportal.so:deskutils/libportal \
		libportal-gtk4.so:deskutils/libportal-gtk4 \
		libjson-glib-1.0.so:devel/json-glib
RUN_DEPENDS=	geoclue>=0:net/geoclue

USES=		desktop-file-utils gettext gnome meson pkgconfig tar:xz
USES+=	cpe
CPE_VENDOR=	gnome
USE_GNOME=	cairo glib20 gtk40 introspection:build libadwaita \
		libxml2 librsvg2
USE_LDCONFIG=	yes
USE_GNOME+=	gtk-update-icon-cache
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Maps.gschema.xml

post-install:
	@${RM} "${PREFIX}/share/gnome-maps/icons/hicolor/16x16/apps/explore-symbolic copy.svg"

.include <bsd.port.mk>
