PORTNAME=	gnome-weather
PORTVERSION=	42.0
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Weather application for GNOME
WWW=		https://wiki.gnome.org/Design/Apps/Weather

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING.md

LIB_DEPENDS=	libgeoclue-2.so:net/geoclue \
		libgjs.so:lang/gjs \
		libgweather-3.so:net/libgweather \
		libgweather-4.so:net/libgweather4 \
		libhandy-1.so:x11-toolkits/libhandy

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig tar:xz
USE_GNOME=	gtk40 libadwaita
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Weather.gschema.xml

.include <bsd.port.mk>
