PORTNAME=	tinysparql
PORTVERSION=	3.8.2
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER= 	ports@MidnightBSD.org
COMMENT=	RDF triple store library with SPARQL 1.1 interface
WWW=		https://gitlab.gnome.org/GNOME/tinysparql

LICENSES= 	lgpl2.1 gpl2 bsd3
LICENSE_COMB=	multi

BINARY_ALIAS=	python3=${PYTHON_VERSION}
BUILD_DEPENDS=	a2x:textproc/asciidoc
LIB_DEPENDS=	libavahi-glib.so:net/avahi-app \
		libdbus-1.so:devel/dbus \
		libsoup-3.0.so:devel/libsoup3 \
		libstemmer.so:textproc/snowballstemmer \
		libicutu.so:devel/icu \
		libjson-glib-1.0.so:devel/json-glib \

USES=		gettext gnome meson pkgconfig sqlite vala:build python:build
USE_GNOME=	glib20 libxml2 introspection:build pygobject3
CONFIGURE_ARGS=	-Dsystemd_user_services=false \
		-Dbash_completion=true \
		-Dbash_completion_dir=${PREFIX}/etc/bash_completion.d \
		-Ddocs=false
LDFLAGS=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
