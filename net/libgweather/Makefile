# $MidnightBSD$

PORTNAME=	libgweather
PORTVERSION=	3.28.2
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to accessing online weather informations

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vala:lang/vala
LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup \
		libgeocode-glib.so:net/geocode-glib

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig python:3.6+,build tar:xz
USE_GNOME=	gtk30 introspection:build libxml2
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
MESON_ARGS=	-Dglade_catalog=false

GLIB_SCHEMAS=	org.gnome.GWeather.enums.xml \
		org.gnome.GWeather.gschema.xml

BINARY_ALIAS=	python3=${PYTHON_VERSION}

post-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/libdata/pkgconfig/
	${CP} ${FAKE_DESTDIR}${PREFIX}/lib/pkgconfig/* ${FAKE_DESTDIR}${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
