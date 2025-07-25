PORTNAME=	gnome-calendar
PORTVERSION=	47.0
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple and beautiful calendar application for GNOME
WWW=		https://wiki.gnome.org/Apps/Calendar/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas
LIB_DEPENDS=	libical.so:devel/libical \
		libsoup-3.0.so:devel/libsoup3 \
		libgweather-4.so:net/libgweather4 \
		libgeoclue-2.so:net/geoclue
RUN_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 desktop-file-utils gettext gnome \
		localbase:ldflags meson pkgconfig python:build tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	cairo evolutiondataserver3 libadwaita
BINARY_ALIAS=	python3=${PYTHON_VERSION}
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.calendar.enums.xml \
		org.gnome.calendar.gschema.xml

NO_TEST=	yes

.include <bsd.port.mk>
