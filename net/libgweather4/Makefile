PORTNAME=	libgweather
PORTVERSION=	4.6.0
PORTREVISION=	0
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	4
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to access online weather information
WWW=		https://gitlab.gnome/GNOME/libgweather

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gi-docgen>0:textproc/py-gi-docgen@${PY_FLAVOR}
BUILD_DEPENDS+=	gweather-locations>=2026.2:net/gweather-locations
LIB_DEPENDS=	libgeocode-glib-2.so:net/geocode-glib2 \
		libsoup-3.0.so:devel/libsoup3 \
		libjson-glib-1.0.so:devel/json-glib
RUN_DEPENDS=	gweather-locations>=2026.2:net/gweather-locations

USES=		gettext gnome localbase meson pkgconfig python:build \
		tar:xz vala:build
USE_GNOME=	glib20 gtk30 libxml2 introspection:build pygobject3
USE_LDCONFIG=	yes

MESON_ARGS=	-Dtests=false

GLIB_SCHEMAS=	org.gnome.GWeather4.enums.xml \
		org.gnome.GWeather4.gschema.xml

NO_TEST=	yes

.include <bsd.port.mk>
