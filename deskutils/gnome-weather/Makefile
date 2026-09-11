PORTNAME=	gnome-weather
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Weather application for GNOME
WWW=		https://apps.gnome.org/Weather/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING.md

PORTSCOUT=	limit:^50\.

BUILD_DEPENDS=	tsc:lang/typescript
LIB_DEPENDS=	libgeoclue-2.so:net/geoclue \
		libgjs.so:lang/gjs \
		libgweather-4.so:net/libgweather4

USES=		desktop-file-utils gettext gnome localbase meson pkgconfig \
		tar:xz
USE_GNOME=	glib20 gtk40 introspection:build libadwaita

GLIB_SCHEMAS=	org.gnome.Weather.gschema.xml
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
